class Admin::CustomersController < ApplicationController
  
  def index
     @customers = Customer.all
     @customers = Customer.page(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customers = Customer.find(params[:id])
    customers.update(customer_params)
    flash[:notice] = "会員情報を変更しました。"
    redirect_to admin_customers_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :password, :delete_user)
  end
  
end