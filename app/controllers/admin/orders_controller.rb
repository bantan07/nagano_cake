class Admin::OrdersController < ApplicationController
  
  def show
   @order = Order.find(params[:id])
   @customer = Customer.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
     if @order.update(order_params)
     flash[:notice] = "successfully" 
     redirect_to  admin_order_path(@order.id)
     else
      render :show
     end  
  end
  
  private
   
  def item_params
   params.require(:oder).permit(:name, :created_at, :address, :payment_method, :is_active, :price, :amount)
  end
   
end
