class ChangeVariablesName < ActiveRecord::Migration
  def change
    rename_column :stylesheets, :variable, :variables
  end
end
