class Admin::PostsController < AdminController

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      @post.publish! if publishing?
      @post.save_as_draft! if drafting?
      if params[:category_ids]
        params[:category_ids].each do |category_id|
          PostCategory.create(
            post_id: @post.id,
            category_id: category_id
          )
        end
      end
      redirect_to admin_post_path(@post), notice: "#{@post.title} was susccessfully updated"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    if params[:posts]
      posts = params[:posts]
      @posts = posts.regular_post
    else
      @posts = Post.regular_post.page params[:page]
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
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)
    if @post.save
      @post.publish! if publishing?
      @post.save_as_draft! if drafting?
      if params[:category_ids]
        params[:category_ids].each do |category_id|
        PostCategory.where(post_id: @post.id).delete_all
        PostCategory.create(
          post_id: @post.id,
          category_id: category_id
          )
        end
      end
      redirect_to admin_post_path(@post), notice: "#{@post.title} was susccessfully updated"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_path, notice: "#{@post.title} was successfully deleted" }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image, :remove_image, :site_post, post_categories_attributes: [:post_id])
  end

  def publishing?
    params["commit"] == "Publish"
  end

  def drafting?
    params["commit"] == "Save as Draft"
  end

end
