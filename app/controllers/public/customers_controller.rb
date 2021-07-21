class Public::CustomersController < ApplicationController
  def show
    @customer = current_user
  end

  def edit
    @customer =current_user
    
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
  
  private
  def customer_params
    params.require(:customer).permit(
      :first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :phone_number, :email )
  end   

end

