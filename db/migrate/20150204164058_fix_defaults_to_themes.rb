class FixDefaultsToThemes < ActiveRecord::Migration
  def change
    change_column :themes, :button_bg, :string, default: "#6097b6"
    change_column :themes, :icon_color, :string, default: "#6097b6"
    change_column :themes, :footer_bg, :string, default: "#6097b6"
    change_column :themes, :background_image_id, :string, default: "#6097b6"
  end
end
