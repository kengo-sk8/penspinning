class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  validates :provider,:uid,presence: true
end
