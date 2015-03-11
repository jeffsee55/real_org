class MessageOption < ActiveRecord::Base
  serialize :times
  serialize :spaces
end
