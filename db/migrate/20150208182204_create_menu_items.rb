class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_id
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
