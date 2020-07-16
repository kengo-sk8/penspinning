class LikesController < ApplicationController
  before_action :set_variables

  def like
    #Userモデルの呼び出しをcurrent_userで行う。これにより、自動的にuser_idにcurrent_user.idが指定される。
    like = current_user.likes.new(product_id: @product.id)
    # binding.pry
    like.save
  end

  def unlike
    like = current_user.likes.find_by(product_id: @product.id)
    like.destroy
  end

  private

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
    # @id_nameは非同期の時に使う
  end

end
