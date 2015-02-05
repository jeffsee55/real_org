class AddColorsToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :button_bg, :string
    add_column :themes, :icon_color, :string
    add_column :themes, :footer_bg, :string
    add_column :themes, :background_image_id, :string
  end
end
