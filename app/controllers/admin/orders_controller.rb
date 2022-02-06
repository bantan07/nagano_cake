class Admin::OrdersController < ApplicationController
  
  def show
   @order = Order.find(params[:id])
   @order_detalis = @order.order_detalis
   @total=0
   @order_detalis.each do |order_detail|
   @total += order_detail.item.price*order_detail.amount 
   end 
  end
  
  def update
    @order = Order.find(params[:id])
     if @order.update(order_params)
      if @order.status == "confirm_payment"
       p @order.order_detalis
       
       p "ty"
       
         @order.order_detalis.update_all(making_status: "waiting_for_production")
      end
     redirect_to  admin_order_path(@order.id)
     else
      render :show
     end 
  end
  
  private
   
  def order_params
   params.require(:order).permit(:status)
  end
   
end
