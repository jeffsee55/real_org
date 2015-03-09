class AddFieldsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :days, :text
    add_column :messages, :times, :text
    add_column :messages, :spaces, :text
    add_column :messages, :concerns, :text
    add_column :messages, :phone, :string
  end
end
