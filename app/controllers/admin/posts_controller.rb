class Admin::PostsController < AdminController

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.create(post_params)
    params[:category_ids].each do |category_id|
      PostCategory.create(
        post_id: @post.id,
        category_id: category_id
      )
    end
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path(@post.id), notice: "#{@post.title} was susccessfully updated"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :back, notice: "#{@post.title} was successfully deleted"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id, post_categories_attributes: [:post_id])
  end

end
