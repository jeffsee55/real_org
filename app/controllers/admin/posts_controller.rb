class Admin::PostsController < AdminController
  layout 'post', only: [:new, :edit]
  before_action :set_post, only: [:edit, :update, :updatish, :show, :destroy]
  skip_before_filter :verify_authenticity_token, only: [:auto_save, :auto_update]


  def new
    # Create the post so that autosave has an id to save to
    @post = Post.new
    @post.body = session[:auto_saved_post] if session[:auto_saved_post]
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      if params[:category_ids]
        params[:category_ids].each do |category_id|
          PostCategory.create(
            post_id: @post.id,
            category_id: category_id
          )
        end
      end
      session[:auto_saved_post] = nil
      @post.publish! if publishing?
      @post.save_as_draft! if drafting?
      redirect_to admin_post_path(@post), notice: "#{@post.title} was susccessfully created"
    else

      redirect_to new_admin_post_path,  alert: "Post could not be saved"
    end
  end

  def show
  end

  def index
    if params[:posts]
      posts = params[:posts]
      @posts = posts.regular_post
    else
      @posts = Post.regular_post.page params[:page]
    end
    if session[:auto_saved_post]
      @session_post = Post.new(title: "Autosaved Draft", body: session[:auto_saved_post])
      @posts.unshift(@session_post)
    end
  end

  def search
    if params[:q]
      @posts = @q.result(distinct: true)
    else
      @posts = Post.first(3)
    end
  end

  def site_posts
    @posts = Post.site_post.page params[:page]
  end

  def edit
    @categories = Category.all
  end

  def update
    @post.update(post_params)
    if @post.save
      @post.publish! if publishing?
      @post.save_as_draft! if drafting?
      if params[:category_ids]
        PostCategory.where(post_id: @post.id).delete_all
        params[:category_ids].each do |category_id|
        PostCategory.create(
          post_id: @post.id,
          category_id: category_id
          )
        end
      end
      session[:auto_saved_post] = nil
      redirect_to admin_post_path(@post), notice: "#{@post.title} was susccessfully updated"
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_path, alert: "#{@post.title} was successfully deleted" }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def auto_update
    if params[:id]
      post = Post.find(params[:id])
      post.update(body: params[:body])
    else
      # If there is no id save the body to the session
      puts "Autosaved"
      session[:auto_saved_post] = params[:body]
      puts session[:auto_saved_post]
    end
    render nothing: true, status: 200
  end

  def clear_auto_saved_post
    session[:auto_saved_post] = nil
    redirect_to :back, alert: "Autosaved Draft deleted"
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image, :remove_image, :pinterest_image, :remove_pinterest_image, :site_post, post_categories_attributes: [:post_id])
  end

  def publishing?
    params["commit"] == "Publish"
  end

  def drafting?
    params["commit"] == "Save as Draft"
  end

end
