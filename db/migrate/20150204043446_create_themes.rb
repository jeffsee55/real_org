class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :header_bg

      t.timestamps
    end
  end
end
