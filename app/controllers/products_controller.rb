class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    @parents = Category.order("id ASC").limit(16)
  end

  def show
    @parents = Category.order("id ASC").limit(16)
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render :create
    else
      render :new
    end
  end


  def destroy
    if @product.destroy
      render :destory
    else
      redirect_to product_path(@product.id)
    end
  end

  def edit
    @parents = Category.order("id ASC").limit(16)
    # 下記コードは、編集時に動画データがなくなるため、キャッシュで保存させてる(公式ドキュメントに記述例あり)
    @product.image.cache! unless @product.image.blank?
  end

  def update
    @parents = Category.order("id ASC").limit(16)
    if @product.update(product_params)
      render :update
    else
      flash[:alert] = '正しく入力してください'
    redirect_to edit_product_path(@product.id)
    end
  end

  #カテゴリー機能
  def mid_category
    @mid_categories = Category.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

    private
    def product_params
      params.require(:product).permit(:pen_history_id, :category_id, :youtube_url, :text ,:image,:image_cache).merge(user_id: current_user.id)
    end

    def set_product
      @product = Product.find(params[:id])
      # :edit, :update, :showにitem.idを与える必要がある為、記述した
    end

end
