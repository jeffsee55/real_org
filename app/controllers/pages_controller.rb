class PagesController < ApplicationController
  def home
    @welcome_post = Post.find_by_title("Welcome Message")
    @post = Post.published_non_projects.first
    @posts = Post.published_non_projects.uniq.first(5)[1..-1]
    @categories = Category.all
    @subscriber = Subscriber.new
  end

  def about
    @post = Post.find_by_title("About Me")
    @subscriber = Subscriber.new
    @categories = Category.all
  end

  def contact
    @message = Message.new
    @contact_poster = Post.find_by_title("Contact Poster")
    @recent_projects = Post.find_by_title("Recent Projects")
    @about_me = User.last
    @work_with_me = Post.find_by_title("Work With Me")
    @posts = Post.joins(:categories).where(categories: { name: "Recent Projects" }).published.limit(3)
    @categories = Category.all
  end
end
