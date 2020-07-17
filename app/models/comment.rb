class Comment < ApplicationRecord
  belongs_to :product  # productsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  validates :text, presence: true, length: {maximum: 250}
end
