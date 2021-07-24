class Public::ShippingsController < ApplicationController
  def index
    @shippings = Shipping.all
    @shipping = Shipping.new

  end

  def create
    @shipping = Shipping.new(shipping_params)
    @shipping.customer_id = current_customer.id
    @shipping.save
    redirect_to shippings_path
  end

  def edit
    @shipping = Shipping..find(params[:id])
  end

  def update
    @shipping= Shipping.find(params[:id])
    shipping.update(shipping_params)
    redirect_to admin_customers_path
  end

  private

  def shipping_params
    params.permit(:customer_id, :name, :postcode, :address)
  end
end
