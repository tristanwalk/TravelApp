class Receipt < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :expense

  validates_presence_of :image_url
end
