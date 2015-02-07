class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  scope :alphabetical, -> { order("name ASC") }
  scope :regular, -> { where.not(name: "Recent Projects")}

  def nice_name
    name.gsub(/%20/, " ")
  end

  def image
    posts.last.image
  end
end
