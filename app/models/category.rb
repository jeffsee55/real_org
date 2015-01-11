class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  def nice_name
    name.gsub(/%20/, " ")
  end
end
