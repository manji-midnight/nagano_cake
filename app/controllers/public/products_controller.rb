class Public::ProductsController < ApplicationController

  def index
    @products = Product.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :genre_id)
  end

end
