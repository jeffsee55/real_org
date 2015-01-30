class CreateStylesheets < ActiveRecord::Migration
  def change
    create_table :stylesheets do |t|
      t.text :variable

      t.timestamps
    end
  end
end
