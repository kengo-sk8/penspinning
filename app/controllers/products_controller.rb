class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    # url = params[:product][:youtube_url]
    # url = url[32..42]
    # @product.youtube_url = url
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
  end

  def update
    if @product.update(product_params)
      render :update
    else
      flash[:alert] = '正しく入力してください'
    redirect_to edit_product_path
    end
  end

    private
    def product_params
      params.require(:product).permit(:pen_type_id, :youtube_url, :text)
    end

    def set_product
      @product = Product.find(params[:id])
      # :edit, :update, :showにitem.idを与える必要がある為、記述した
    end

end
