class AddSitePostToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :site_post, :boolean, default: false
  end
end
