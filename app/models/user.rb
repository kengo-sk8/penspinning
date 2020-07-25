class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy  # commentsテーブルとのアソシエーション
  has_many :likes, dependent: :destroy
  has_many :like_products, through: :likes, source: :product
  has_many :sns_credentials, dependent: :destroy

  mount_uploader :image, ImageUploader # アイコン投稿のアソシエーション

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  # validates :password_confirmation, presence: true, length: { in: 6..30 }
  # uniqueness 同一データは一つのみ許可する

  #ゲストログイン
  def self.guest
    find_or_create_by!(name: 'guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  # < sns 認証 >
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?  #userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }  #User.form_omniauth、メゾットでuserとsnsをハッシュで返す
  end
end
