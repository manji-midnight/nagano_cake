class Public::ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all
    @shipping = Shipping.new
  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    if @shipping.save
      flash[:success] = "新しい配送先の登録が完了しました。"
    redirect_to shippings_path
    else
      @customer = current_customer
      @shipping = @customer.shipping
      flash[:danger] = "新しい配送先内容に不備があります。"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    #shipping.update(shipping_params)
    redirect_to admin_customers_path
  end

  def destroy
    @shipping = Shipping.find(params[:id])
    @shipping.customer_id = current_customer.id
    @shipping.destroy
    flash[:success] = "配送先の削除が完了しました。"
    redirect_to shippings_path
  end

  private

  def shipping_params
    params.require(:shipping).permit(:customer_id, :name, :postcode, :address)
  end
end
