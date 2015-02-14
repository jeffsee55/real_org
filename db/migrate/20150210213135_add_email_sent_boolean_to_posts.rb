class AddEmailSentBooleanToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :email_sent?, :boolean
  end
end
