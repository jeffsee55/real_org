class CategoriesController < ApplicationController

  def show
    @q = Post.ransack(params[:q])
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.alphabetical.regular.page params[:page]
  end

end
