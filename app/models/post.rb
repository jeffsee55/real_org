class Post < ActiveRecord::Base
  belongs_to :author
  has_many :post_categories
  has_many :categories, through: :post_categories

  accepts_nested_attributes_for :post_categories
end
