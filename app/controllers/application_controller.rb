class ApplicationController < ActionController::Base
  before_action :set_ancestry
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ゲストログイン変更&消去防止
  def check_guest
    name = resource&.name || params[:user][:name]
    email = resource&.email || params[:user][:email].downcase
    if name == 'guest' && email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end



  def set_ancestry
    @parents = Category.where(ancestry: nil)
  end
end
