class AddButtonColorToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :button_color, :string
  end
end
