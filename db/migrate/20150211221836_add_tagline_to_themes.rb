class AddTaglineToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :tagline, :string
  end
end
