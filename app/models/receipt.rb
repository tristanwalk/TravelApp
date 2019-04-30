class Receipt < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :expense

  validates_presense_of :image_url
end
