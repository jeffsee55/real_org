class CommentsController < ApplicationController

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :title, :body, :post_id)
  end

end
