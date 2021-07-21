class Public::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :genre_id)
  end

end
