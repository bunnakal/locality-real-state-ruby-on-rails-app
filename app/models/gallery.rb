class Gallery < ActiveRecord::Base
  mount_uploader :image_gallery, ImageUploader
  belongs_to :property
end
