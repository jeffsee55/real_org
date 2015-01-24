# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'nokogiri'

cat = Nokogiri::XML(open("https://therealisticorganizer.blogspot.com/feeds/posts/default/-/wrongterm"))
cat.root.css('category').each do |c|
  category = c.attribute('term').to_s.strip.gsub(' ', '%20')
  doc = Nokogiri::XML(open("http://therealisticorganizer.blogspot.com/feeds/posts/default/-/#{category}"))
  doc.root.css('entry').each do |post|
    id = post.css('id').to_s
    post_id = id.split('post-')[1].split("<")[0]
    title = post.css('title')
    published = post.css('published')
    updated = post.css('updated')
    body = post.css('content')
    author = post.css('author')
    doc = Nokogiri::HTML(body.text)
    first_image = doc.xpath("//img")[0]['src'].split(" ")[0]
    post = Post.find_or_create_by(unique_number: post_id) do |p|
      p.title = title.text
      p.body = body.text
      p.created_at = published.text
      p.updated_at = updated.text
      p.unique_number = post_id
      backend = Refile.backends["store"]
      file = backend.upload(open(first_image))
      p.image = file
    end
    category_record = Category.find_or_create_by(name: category)
    PostCategory.create(
      post_id: post.id,
      category_id: category_record.id
    )
  end
end
