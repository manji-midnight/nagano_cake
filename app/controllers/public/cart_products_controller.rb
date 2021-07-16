class Public::CartProductsController < ApplicationController
before_action :setup_cart_product_item!, only: [:new, :update, :destroy]

  def show
    @cart_products = current_cart_product.cart_products
  end

  def new
    if @cart_product.blank?
      @cart_product = current_cart_product.cart_products.build(product_id: params[:product_id])
    end

    @cart_product.quantity += params[:quantity].to_i
    @cart_product.save
    redirect_to current_cart_product
  end

  def update
    @cart_product.update(quantity: params[:quantity].to_i)
    redirect_to current_cart_product
  end

  def destroy
    @cart_product.destroy
    redirect_to current_cart_product
  end

  private

  def setup_cart_product_item!
    @cart_product_item = current_cart_product.cart_product_items.find_by(product_id: params[:product_id])
  end
end
