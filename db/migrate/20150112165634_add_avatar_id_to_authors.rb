class AddAvatarIdToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :avatar_id, :string
  end
end
