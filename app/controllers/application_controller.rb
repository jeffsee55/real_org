class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_query, :theme, :set_menu, :set_user

  private

  def set_menu
    @menu ||= Menu.last
    @slot_1 ||= Category.where(menu_slot: 1)
    @slot_2 ||= Category.where(menu_slot: 2)
    @slot_3 ||= Category.where(menu_slot: 3)
  end

  def theme
    @theme ||= Theme.last
  end

  def set_query
    @q ||= Post.ransack(params[:q])
  end

  def set_user
    @user ||= User.last
  end
end
