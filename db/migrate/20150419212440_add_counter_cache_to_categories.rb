class AddCounterCacheToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :posts_count, :integer, default: 0

    Category.reset_column_information
    Category.all.each do |c|
      Category.update_counters c.id, :posts_count => c.posts.length
    end
  end
end
