class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する

  mount_uploader :image, ImageUploader
  belongs_to_active_hash :pen_history
  has_many :category

  validate :check_image
  def check_image
    if !['.mp4', '.mov'].include?(File.extname(name).downcase)
        errors.add(:image, "mp4, mpvのみアップロードできます。")
    elsif file.size > 1.megabyte
        errors.add(:image, "10MBまでアップロードできます")
    end
  end

end
