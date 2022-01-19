class Public::CustomersController < ApplicationController
  
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
      redirect_to customers_path(@customer.id)
   else
      flash[:notice] = "error" 
      render :edit
   end
 end
 
 def confirm
  @customer = Customer.find(params[:id])
 end
 
 def withdraw
  @customer = Customer.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  
  
  private
   
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
