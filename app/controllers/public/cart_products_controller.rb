class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @product = Product.find_by(params[:id])
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.product_id = @product.id
    @cart_product.customer_id = current_customer.id
    @cart_product.save
    redirect_to cart_products_path
  end

  def update

  end

  def destroy
  end

  def destroy_all
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :genre_id)
  end

  def cart_product_params
    params.permit(:customer_id, :product_id, :quantity_id)
  end

end
