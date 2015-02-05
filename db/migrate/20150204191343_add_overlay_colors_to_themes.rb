class AddOverlayColorsToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :primary_gradient, :string, default: "#e66f66"
    add_column :themes, :secondary_gradient, :string, default: "#68e9ca"
    add_column :themes, :header_color, :string, default: "#575454"
  end
end
