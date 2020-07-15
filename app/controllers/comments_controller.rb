class CommentsController < ApplicationController
  before_action :set_instance

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to product_path(params[:product_id])  }
        format.json
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :show
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to product_path(@product.id)
    else
      render :show
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def set_instance
    @product = Product.find(params[:product_id])
  end


end

# def create
#   comment = Comment.create(comment_params)
#   redirect_to "/products/#{comment.product.id}"  # コメントと結びつくツイートの詳細画面に遷移する
# end

# private
# def comment_params
#   params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
# end
