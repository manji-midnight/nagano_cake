class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart_product

  def current_cart_product
    if current_user
      current_cart_product = curreunt_user.cart_product || curreunt_user.create_cart_product!
    else
      cart_product = CartProduct.find(session[:cart_product_id]) || CartProduct.create
      session[:cart_product_id] ||= current_cart_product.id
    end
    current_cart_product
  end
end