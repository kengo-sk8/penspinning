class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する

  mount_uploader :image, ImageUploader
  belongs_to_active_hash :pen_history
  has_many :category

  validates :image, :pen_history, :category_id, presence: true
  validates :text,presence: true, length: {maximum: 1000} #商品説明が1000文字しか打てない様に設定した
end
