class Admin::ThemesController < AdminController
  before_filter :get_theme, only: [:show, :edit, :destroy]

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to :back, notice: "Your new theme has been saved."
    else
      render :new
    end
  end

  def show
  end

  def update
    @theme.update(theme_params)
    redirect_to :back, notice: "Your new theme has been saved."
  end

  def edit
  end

  def destroy
  end

  private

    def get_theme
      @theme = Theme.find(params[:id])
    end

    def theme_params
      params.require(:theme).permit(:header_bg, :header_color, :footer_bg, :footer_color, :button_color, :button_bg, :logo, :icon_color, :background_image, :primary_gradient, :secondary_gradient, :blog_lovin, :facebook, :pinterest, :instagram,  :google_plus, :tagline, :logo_image, :signature_image, :remove_logo_image, :remove_signature_image, :remove_background_image)
    end
end
