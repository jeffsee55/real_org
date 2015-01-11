class AddColorOptionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :tag_color, :string
  end
end
