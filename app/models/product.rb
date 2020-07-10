class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # gem 'active_hash'を導入したら、extend ActiveHash::Associations::ActiveRecordExtensionsとbelongs_to_active_hash :〇〇(モデル名)を記述する

  mount_uploader :image, ImageUploader
  belongs_to_active_hash :pen_history
  has_many :category

  validate :image_content_type, if: :was_attached?
  # was_attached?には、[?]がついてるため、true falseのよく割りを果たしている
  def image_content_type
    extension = ['image/mov', 'image/mp4']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end




end
