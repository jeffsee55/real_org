class Admin::AuthorsController < AdminController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.create(author_params)
    redirect_to admin_author_path(@author.id)
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    redirect_to admin_author_path(@author.id)
  end

  def destroy
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :bio, :avatar, :remove_avatar, :avatar_cache_id)
  end

end
