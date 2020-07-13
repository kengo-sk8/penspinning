class UsersController < ApplicationController
  def show
    @name = current_user.name
    @products = current_user.products
  end



end
