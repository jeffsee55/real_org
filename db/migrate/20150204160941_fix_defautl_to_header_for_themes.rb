class FixDefautlToHeaderForThemes < ActiveRecord::Migration
  def change
    change_column :themes, :header_bg, :string, default: "#6097b6"
  end
end
