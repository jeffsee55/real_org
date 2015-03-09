class CreateMessageOptions < ActiveRecord::Migration
  def change
    create_table :message_options do |t|
      t.text :time
      t.text :spaces

      t.timestamps
    end
  end
end
