class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
    @cart_products = current_customer.cart_products
    @order = Order.new(order_params)
    if params[:order][:shipping_address] === "1"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:shipping_address] === "2"
      @address = Shipping.find(params[:shipping_address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    else params[:order][:shipping_address] === "3"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_thankyou_path
  end

  def index
    @orders = Order.all
  end

  def thankyou
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
    params.permit(:customer_id, :shipping_fee,:total_price,:payment_method,:name,:postcode,:address,:order_status)
  end

end
