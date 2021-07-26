class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order_detail.production_status == "製作中"
        @order.update(order_status: "製作中")
    end
    if @order.order_details.count == @order.order_details.where(production_status: "製作完了").count
       @order.update(order_status: "発送準備中")
    end
    redirect_back(fallback_location: root_path)
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
  
end

