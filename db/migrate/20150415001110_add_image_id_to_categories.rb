class AddImageIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :image_id, :string
  end
end
