class PagesController < ApplicationController
  def home
    @post = Post.where(published: true).last
    @categories = Category.all
  end

  def about
  end

  def contact
    @message = Message.new
    @contact_poster = Post.find_by_title("Contact Poster")
    @recent_projects = Post.find_by_title("Recent Projects")
    @about_me = Post.find_by_title("About Me")
    @work_with_me = Post.find_by_title("Work With Me")
    @posts = Post.all
    @categories = Category.all
  end
end
