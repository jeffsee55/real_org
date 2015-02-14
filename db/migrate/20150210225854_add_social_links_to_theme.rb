class AddSocialLinksToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :facebook, :string
    add_column :themes, :instagram, :string
    add_column :themes, :pinterest, :string
    add_column :themes, :rss, :string
    add_column :themes, :google_plus, :string
  end
end
