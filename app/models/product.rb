class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する

  mount_uploader :video, ImageUploader
  belongs_to_active_hash :pen_type

end
