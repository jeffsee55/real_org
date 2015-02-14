class ChangeEmailSentColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :email_sent?, :email_sent
    add_column :posts, :email_sent_at, :datetime
  end
end
