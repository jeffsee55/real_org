class PagesController < ApplicationController
  def home
    @post = Post.where(published: true).last
    @categories = Category.all
  end

  def about
  end
end
