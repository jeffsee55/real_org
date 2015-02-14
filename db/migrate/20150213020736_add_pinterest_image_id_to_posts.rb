class AddPinterestImageIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pinterest_image_id, :string
  end
end
