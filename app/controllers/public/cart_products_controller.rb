class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @existing_product = CartProduct.find_by(product_id: params[:product_id])
    if @existing_product.present?
      @update_value = @existing_product.quantity + params[:quantity].to_i
      @existing_product.update(quantity: @update_value)
    else
      @cart_product.save
    end
    redirect_to cart_products_path
  end

  def update
    @cart_products = CartProduct.all
    @cart_products.update(cart_product_params)
    cart_product.save
    redirect_to cart_products_path

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
    params.permit(:customer_id, :product_id, :quantity)
  end

end
