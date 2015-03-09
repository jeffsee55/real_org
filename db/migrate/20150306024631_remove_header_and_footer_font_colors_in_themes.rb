class RemoveHeaderAndFooterFontColorsInThemes < ActiveRecord::Migration
  def change
    remove_column :themes, :footer_font_color
    remove_column :themes, :header_font_color
    add_column :themes, :footer_color, :string, default: "#575454"
  end
end
