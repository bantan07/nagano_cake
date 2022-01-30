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
      flash[:notice] = "successfully" 
      redirect_to customers_path
   else
      flash[:notice] = "error" 
      render :edit
   end
 end
 
 def confirm
  @customer = current_customer
 end
 
 def withdraw
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
 end 
  
  private
   
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
