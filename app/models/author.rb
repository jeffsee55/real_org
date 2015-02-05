class user < ActiveRecord::Base
  has_many :posts
  attachment :avatar

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def short_bio(length)
    bio.truncate(length, seperator: " ")
  end
end
