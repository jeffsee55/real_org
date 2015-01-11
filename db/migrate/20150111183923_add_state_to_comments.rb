class AddStateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :approved, :boolean
    add_column :comments, :spam, :boolean
  end
end
