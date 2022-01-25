class Public::AddressesController < ApplicationController
  
 def index
  @address = Address.new
  @addresses = Address.all
 end
 def create
  @address = Address.new(address_params)
  @address.customer_id = current_customer.id
    if @address.save
     flash[:notice] = "successfully"
     redirect_to addresses_path(@address.id)
    else
     flash[:notice] = "error"
     @addresses = Address.all
     render :index
    end
 end
 
 def edit
  @address = Address.find(params[:id])
 end
 
 def update
   @address = Address.find(params[:id])
   if @address.update(addressr_params)
      flash[:notice] = "successfully" 
      redirect_to address_path(@address.id)
   else
      flash[:notice] = "error" 
      render :edit
   end
 end
 
  
 private
   
   def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
   end

end
