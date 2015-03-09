class Message < ActiveRecord::Base
  before_save :clean_arrays
  after_create :send_notification
  serialize :days
  serialize :times
  serialize :spaces

  default_scope -> { order("created_at DESC") }

  def send_notification
    SiteMailer.new_message(self)
  end

  def clean_arrays
    self.days = self.days.reject { |d| d.blank? } if self.days
    self.times = self.times.reject { |d| d.blank? } if self.times
    self.spaces = self.spaces.reject { |d| d.blank? } if self.spaces
  end

  def message_type
    if self.days || self.times || self.spaces
      "Work Inquiry"
    else
      "Basic Message"
    end
  end
end
