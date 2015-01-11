class AddUniqueNumberToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :unique_number, :string
  end
end
