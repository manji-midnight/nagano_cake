class Admin::HomesController < ApplicationController
  
  def top
    if params[:check] == "0"
      @orders = Order.all.page(params[:page]).per(10)
    elsif params[:check] && (params[:check] != "0")
      @orders = Order.where(customer_id: params[:check]).page(params[:page]).per(8)
      @notice = "注文履歴のみ表示しています。全ての会員の履歴はページ上部のリンクからご覧ください。"
    else
      @orders = Order.all.page(params[:page]).per(8)
    end
  end
  
end
