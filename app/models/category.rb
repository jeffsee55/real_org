class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  attachment :image

  has_many :post_categories
  has_many :posts, through: :post_categories

  scope :alphabetical, -> { order("name ASC") }
  scope :regular, -> { where.not(name: "Recent Projects")}

  def nice_name
    name.gsub(/%20/, " ")
  end

  def post_image
    posts.last.image unless self.posts.empty?
  end

  def generate_link
    "link_to '#{self.name}', category_path(#{self.id})"
  end
end
