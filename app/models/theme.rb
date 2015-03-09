class Theme < ActiveRecord::Base
  attachment :background_image
  attachment :logo_image
  attachment :signature_image
end
