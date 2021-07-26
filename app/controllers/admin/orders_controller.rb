class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:check] == "0"
      @orders = Order.all.page(params[:page]).per(10)
    elsif params[:check] && (params[:check] != "0")
      @orders = Order.where(customer_id: params[:check]).page(params[:page]).per(8)
      @notice = "注文履歴のみ表示しています。全ての会員の履歴はページ上部のリンクからご覧ください。"
    else
      @orders = Order.all.page(params[:page]).per(8)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
       @order.order_details.each do |order_detail|
         order.update(production_status: "製作待ち")
       end
    end
      redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
