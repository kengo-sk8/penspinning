class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する
  belongs_to_active_hash :pen_history, presence: true
  belongs_to :user
  has_many :category
  has_many :comments  # commentsテーブルとのアソシエーション

  mount_uploader :image, ImageUploader

  validates :image, :pen_history_id, :category_id, presence: true
  validates :text,presence: true, length: {maximum: 1000} #商品説明が1000文字しか打てない様に設定した
end
