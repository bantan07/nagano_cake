class Public::AddressesController < ApplicationController
  
 def create
  @address = Address.new
  @addresses = Address.all
  @address = Address.new(address_params)
    if @address.save
     flash[:notice] = "successfully"
     redirect_to addresses_path(@address.id)
    else
     flash[:notice] = "error"
     @address = Address.all
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
      redirect_to address_path(@ad.id)
   else
      flash[:notice] = "error" 
      render :edit
   end
 end
 
  
 private
   
   def address_params
    params.require(:address).permit(:name, :postal_code, :address)
   end

end
