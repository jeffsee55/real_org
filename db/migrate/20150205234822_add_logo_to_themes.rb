class AddLogoToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :logo, :text
  end
end
