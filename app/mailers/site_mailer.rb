class SiteMailer < ActionMailer::Base
  default from: "stefanie@realisticorganizer.com"

  def mandrill_client
    @mandrill_client ||= Mandrill::API.new(ENV["MANDRILL_API_KEY"])
  end

  def new_message(message)
    template_name = "new-message"
    template_content = []
    message = {
      to: [
        {email: "jeffsee.55@gmail.com"},
        {email: "jeff@jeffseedesigns.com"},
      ],
      subject: "New Message from #{message.name}",
      merge_vars: [
        {rcpt: "jeffsee.55@gmail.com",
          vars: [
            {name: "NAME", content: message.name},
            {name: "EMAIL", content: message.email},
            {name: "BODY", content: message.body}
          ]
        }
      ]
    }

    mandrill_client.messages.send_template template_name, template_content, message
  end

  def post_notification(post)
    template_name = "post-notification"
    template_content = []
    message = {
      to: [
        {email: "jeffsee.55@gmail.com"},
        {email: "jeff@jeffseedesigns.com"},
      ],
      subject: "Post: #{post.title}",
      merge_vars: [
        {rcpt: "jeffsee.55@gmail.com",
          vars: [
            {name: "TITLE", content: post.title},
            {name: "EXCERPT", content: post.body.html_safe}
          ]
        }
      ]
    }

    mandrill_client.messages.send_template template_name, template_content, message
  end
end
