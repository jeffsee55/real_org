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

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "#{@category.name} was successfully updated"
    else
      redirect_to :back
    end
  end

  def index
    @categories = Category.alphabetical
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_categories_path, notice: "#{@category.name} was successfully deleted"
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :tag_color)
  end

end
