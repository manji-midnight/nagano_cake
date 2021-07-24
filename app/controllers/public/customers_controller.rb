class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path, notice: "会員情報を変更しました"
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
    @customer.update(delete_user: true)
    reset_session
    redirect_to root_path, alert: "退会しました"
  end

  def withdraw
  end
  
  private
  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email )
  end   

end

