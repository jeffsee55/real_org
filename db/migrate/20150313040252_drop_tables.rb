class DropTables < ActiveRecord::Migration
  def change
    drop_table :menu_items
    drop_table :stylesheets
  end
end
