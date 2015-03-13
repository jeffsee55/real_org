class Admin::MenusController < AdminController

  def show
  end

  def update
    @menu.update(menu_params)
    redirect_to :back, notice: "Menu options updated."
  end

  def edit
  end

  def index
  end

  def destroy
  end

  private

    def menu_params
      params.require(:menu).permit(:slot_1, :slot_2, :slot_3)
    end

end
