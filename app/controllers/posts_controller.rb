class PostsController < ApplicationController
  before_filter :verify_and_set_post, only: :show

  def feed
    @posts= Post.all.limit(10)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
    @categories = Category.regular
    @subscriber = Subscriber.new

    impressionist(@post)
    @post.impressionist_count(filter: :session_hash)
  end

  def index
    if params[:posts]
      posts = params[:posts]
      @posts = posts.published_non_projects.page params[:page]
    elsif params[:month]
      @posts = Post.published.group_by { |p| p.published_at.strftime("%B") }[params[:month]]
    else
      @posts = Post.published_non_projects.page params[:page]
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def search
    if params[:q]
      @posts = @q.result(distinct: true)
    else
      @posts = Post.first(3)
    end
  end

  private

  def verify_and_set_post
    @post = Post.friendly.find(params[:id])
    unless @post.published?
      redirect_to root_path, notice: "This post is not available"
    end
  end
end
