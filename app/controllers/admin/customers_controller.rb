class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    
  end


  def show
    @customer = Customer.find(params[:id])
    
  end

  def edit
    @customers = Customer.find(params[:id])
    
  end

  def update
    
  if  @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to customer_path(@customer.id)
   
  else
    render :edit
    
  end
    
  end
  
  
  
private

def customer_params
    params.require(:customer).permit( :last_name, :first_name, :address, :first_name_kana, :eemailmail, :phone_number, :delete_user, :last_name_kana, :postcode, :password)
    
end

end
