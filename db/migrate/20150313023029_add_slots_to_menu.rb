class AddSlotsToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :slot_1, :string
    add_column :menus, :slot_2, :string
    add_column :menus, :slot_3, :string
  end
end
