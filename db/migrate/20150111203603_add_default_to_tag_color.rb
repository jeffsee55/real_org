class AddDefaultToTagColor < ActiveRecord::Migration
  def change
    change_column :categories, :tag_color, :string, default: "#477DCA"
  end
end
