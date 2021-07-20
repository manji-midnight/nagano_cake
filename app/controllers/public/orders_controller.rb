class Public::OrdersController < ApplicationController
  def new
  end

  def create
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all(product_id: params[:product_id])
  end

  def thankyou
  end

  def comfirm
  end

  private
  def product_params
    params.require(:product).permit(:name)
  end

end
