class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
  end

  def update
  end
  
  
  
  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :total_price, :payment_method, :name, :postcode, :address, :order_status)
  end
    
end
