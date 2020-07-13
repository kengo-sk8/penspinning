class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products


  validates :name, presence: true, length: { maximum: 10}
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  # validates :password, :password_confirmation, presence: true, length: { in: 6..30 }
  # uniqueness 同一データは一つのみ許可する

  #ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
