class AddParentToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :menu_slot, :string
  nd
end
