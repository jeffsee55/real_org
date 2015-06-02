class AddBlogLovinToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :blog_lovin, :string
  end
end
