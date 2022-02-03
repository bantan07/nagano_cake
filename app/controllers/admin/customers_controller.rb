class Admin::CustomersController < ApplicationController
   before_action :authenticate_admin!
  
  def index
   @customers = Customer.all
  end
  
  def show
   @customer = Customer.find(params[:id])
  end
  
  def edit
   @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     flash[:notice] = "successfully" 
     redirect_to  admin_customers_path(@customer.id)
    else
      flash[:notice] = "error" 
      render :edit
    end
  end
  
  private
   
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, 
    :postal_code, :address, :telephone_number, :email, :is_active)
  end

end

