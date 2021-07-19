class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @product = Product.find(params[:id])
    @cart_product.customer_id = current_customer_id
    @cart_product = current_cart_product.cart_products.build(product_id: params[:product_id])
    @cart_product.save
    redirect_to public_cart_product
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

end
