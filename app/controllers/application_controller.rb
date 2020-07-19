class ApplicationController < ActionController::Base
  before_action :set_ancestry
  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?


  #ゲストログイン変更&消去防止
  def check_guest
    name = resource&.name || params[:user][:name]
    email = resource&.email || params[:user][:email].downcase
    if name == 'guest' && email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません！！'
    end
  end

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  def set_ancestry
    @parents = Category.where(ancestry: nil)
  end
end
