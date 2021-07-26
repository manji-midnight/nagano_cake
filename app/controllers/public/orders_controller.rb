class Public::OrdersController < ApplicationController

  def thankyou
  end

  def new
    @order = Order.new
  end

  def comfirm
    @cart_products = current_customer.cart_products
    @total_price = @cart_products.inject(0) { |sum, product| sum + product.sum_of_price }
    @order = Order.new(order_params)
    if params[:order][:shipping_address] === "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:shipping_address] === "2"
      @address = Shipping.find(params[:order][:shipping_address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.address_name = @address.name
    else params[:order][:shipping_address] === "3"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_customer.cart_products.each do |cart_product|
		  @order_detail = OrderDetail.new
		  @order_detail.order_id = @order.id
		  @order_detail.product_id = cart_product.product_id
		  @order_detail.quantity = cart_product.quantity
		  @order_detail.taxed_price = cart_product.product.add_tax_price
		  @order_detail.save
		end
	  current_customer.cart_products.destroy_all
    redirect_to orders_thankyou_path
  end

  def index
    @orders = current_customer.orders
    @order_details = OrderDetail.all(params[:order_id])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all(product_id: params[:product_id])
  end

  private
  def product_params
    params.require(:product).permit(:name)
  end

  def cart_product_params
    params.permit(:customer_id, :product_id, :quantity)
  end

  def order_params
    params.permit(:customer_id, :shipping_fee, :total_price, :payment_method, :address_name, :postcode, :address, :order_status)
  end

  def order_detail_params
    params.permit(:order_id)
  end

end
