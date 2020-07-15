class Comment < ApplicationRecord
  belongs_to :product  # productsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

end
