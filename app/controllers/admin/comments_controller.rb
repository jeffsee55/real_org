class Admin::CommentsController < AdminController
  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :description)
  end

end
