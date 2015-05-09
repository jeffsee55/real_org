#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "The Realistic Organizer"
    xml.author "Stefanie Sliger"
    xml.description Theme.last.tagline
    xml.link "therealisticorganizer.com"
    xml.language "en"

    for article in @posts
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        xml.author "Stefanie Sliger"
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link "therealisticorganizer.com"
        xml.guid article.id

        text = article.body
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        if article.image.exists?
            image_url = "https://s3-us-west-2.amazonaws.com/real-org-images/store/#{article.shared_image.id}"
            image_caption = article.title
            image_align = ""
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
              "
            text = text.sub('{image}', image_tag)
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end
