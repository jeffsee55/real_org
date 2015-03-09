class AddSignatureAndImageIdsToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :signature_image_id, :string
    add_column :themes, :logo_image_id, :string
  end
end
