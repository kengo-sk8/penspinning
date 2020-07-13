class ApplicationController < ActionController::Base
  before_action :set_ancestry
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end



  def set_ancestry
    @parents = Category.where(ancestry: nil)
  end
end
