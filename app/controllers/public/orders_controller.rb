class Public::OrdersController < ApplicationController
 
  def new
   @order = Order.new
   @address = Address.new
   @addresses =Address.all
    @order.customer_id = current_customer.id
  end
  
  def index
   @order = Order.new
   @orders = Order.all
  end
  
  def confirm
   @order = current_customer.orders.new
   if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.name
      @order.address = current_customer.address
   else
      params[:order][:address_option] == "2"
      @order.postal_code = address.postal_code
      @order.name = address.name
      @order.address = address.address
   end
  end
  
  def show
   @order = Order.find(params[:id])
  end
  def complete
   Reserve.create!(@order)
  end
  
   private
   
  def order_params
   params.require(:order).permit(:customer_id, :postal_code,  :address, 
   :shipping_cost, :total_payment, :name, :payment_method, :status, :created_at)
  end
end
