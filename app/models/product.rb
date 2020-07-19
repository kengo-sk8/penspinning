class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する
  belongs_to_active_hash :pen_history, presence: true
  belongs_to :user
  has_many :category # カテゴリー機能
  has_many :comments, dependent: :destroy # commentsテーブルとのアソシエーション
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  mount_uploader :image, ImageUploader, dependent: :destroy # 動画投稿のアソシエーション

  validates :image,:pen_history_id, :category_id, presence: true
  validates :text,presence: true, length: {maximum: 1000} #商品説明が1000文字しか打てない様に設定した
  validates :title, presence: true, length: {maximum: 10}

  def self.search(search)
    if search
      Product.where('title LIKE(?)', "%#{search}%")
    else
      Product.all
    end
  end
end



