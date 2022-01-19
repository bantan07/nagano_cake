class Public::RegistrationsController < ApplicationController

 def new 
  @customer = Customer.new
 end
 
 def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "successfully"
      redirect_to  items_path(@customer)
    else
      @customer = Customer.all
      render :index
    end
 end
 
  private
   
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kama, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
