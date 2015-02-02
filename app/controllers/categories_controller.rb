class CategoriesController < ApplicationController

  def show
    @q = Post.ransack(params[:q])
    @category = Category.find(params[:id])
  end

  def index
    redirect_to posts_path
  end

end
