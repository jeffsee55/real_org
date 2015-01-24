class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_categories
  has_many :categories, through: :post_categories
  attachment :image
  attachment :featured_image

  accepts_nested_attributes_for :post_categories

  def short_title
    title.truncate(45, seperator: " ")
  end

  def short_body(length)
    self.body
  end
end
