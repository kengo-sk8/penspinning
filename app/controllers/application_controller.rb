class ApplicationController < ActionController::Base
  before_action :set_ancestry

  def set_ancestry
    @parents = Category.where(ancestry: nil)
  end
end
