class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
 def index
  @address = Address.new
  @addresses = Address.all
  @addresses = current_customer.addresses
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
   if @address.update(address_params)
      flash[:notice] = "successfully" 
      redirect_to addresses_path
   else
      flash[:notice] = "error" 
      render :edit
   end
 end

 def destroy
    @address = Address.find(params[:id]).destroy
    redirect_to addresses_path
 end
 
 private
   
   def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
   end

end
