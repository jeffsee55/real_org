class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
  end

  def index
    redirect_to posts_path
  end

end
