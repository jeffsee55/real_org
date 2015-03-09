class ChangeTimeNameOnMessageOptions < ActiveRecord::Migration
  def change
    remove_column :message_options, :time
    add_column :message_options, :times, :text
  end
end
