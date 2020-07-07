class Product < ApplicationRecord
  mount_uploader :video, ImageUploader
  serialize :video, JSON
  # validates :text, presence: true
end
