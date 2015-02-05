class PagesController < ApplicationController
  def home
    @welcome_post = Post.find_by_title("Welcome Message")
    @post = Post.blog_posts.first
    @posts = Post.blog_posts.first(4)
    @categories = Category.all
    @subscriber = Subscriber.new
  end

  def about
    @post = Post.find_by_title("About Me")
  end

  def contact
    @message = Message.new
    @contact_poster = Post.find_by_title("Contact Poster")
    @recent_projects = Post.find_by_title("Recent Projects")
    @about_me = User.last
    @work_with_me = Post.find_by_title("Work With Me")
    @posts = Post.blog_posts.first(3)
    @categories = Category.all
  end
end
