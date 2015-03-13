class ChangeSlotsForCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :menu_slot
    add_column :categories, :menu_slot, :integer
  end
end
