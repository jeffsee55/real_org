class AddAccentFontColorToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :header_font_color, :string
    add_column :themes, :footer_font_color, :string
  end
end
