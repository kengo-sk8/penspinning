class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    url = params[:product][:youtube_url]
    url = url.last(11)
    @product.youtube_url = url
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end


    private
    def product_params
      params.require(:product).permit(:name, :video, :youtube_ur, :text)
    end




end
