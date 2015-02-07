class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  attachment :image
  attachment :featured_image
  is_impressionable :counter_cache => true

  default_scope -> { order('created_at DESC') }
  scope :site_post, -> { where(site_post: true) }
  scope :regular_post, -> { where(site_post: false) }
  scope :published, -> { where.not(published_at: nil).where(site_post: false).order('published_at DESC') }

  accepts_nested_attributes_for :post_categories

  def short_title
    title.truncate(45, seperator: " ")
  end

  def short_body(length)
    self.body
  end

  def publish!
    # mark :published_at with current time
    update(published_at: Time.now)
    # send mail notification at the next 1:00pm
    SiteMailer.post_notification(self)
  end

  def save_as_draft!
    # mark :published_at with current time
    update(published_at: nil)
    # send mail notification at the next 1:00pm
  end

  def published?
    published_at != nil
  end

  def body_without_images
    require 'nokogiri'
    doc = Nokogiri::HTML(self.body)
    doc.search("img").remove
    doc.to_html
  end

  # def send_to_subscribers
  #   SiteMailer.post_notification(self)
  # end
end
