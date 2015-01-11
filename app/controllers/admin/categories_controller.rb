class Admin::CategoriesController < AdminController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category was successfully created"
    else
      render :new, notice: "Your category was not created"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end
