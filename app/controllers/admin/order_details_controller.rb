class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_dettail_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def order_dettail_params
    params.require(:order_detail).permit(:production_status)
  end

end