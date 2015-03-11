class RemoveRssFromThemes < ActiveRecord::Migration
  def change
    remove_column :themes, :rss
  end
end
