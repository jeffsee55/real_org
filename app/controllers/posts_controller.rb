class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @categories = Category.all
    @subscriber = Subscriber.new

    impressionist(@post)
    @post.impressionist_count(filter: :session_hash)
  end

  def new
    @post = Post.new
  end

  def create
    @post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Your post was successfully created"
    else
      redirect_to :new, notice: "There was a problem creating your post"
    end
  end

  def index
    if params[:posts]
      posts = params[:posts]
      @posts = posts.published.page params[:page]
    else
      @posts = Post.published.page params[:page]
    end
  end

  def search
    if params[:q]
      @posts = @q.result(distinct: true)
    else
      @posts = Post.first(3)
    end
  end

  def edit
  end

  def updated
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id, :image)
  end

end
