class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
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

  def edit
  end

  def updated
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

end
