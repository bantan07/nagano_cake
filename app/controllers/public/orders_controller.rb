class Public::OrdersController < ApplicationController
 
  def new
   @order = Order.new
   @address = Address.new
   @addresses = @addresses.all
  end
  
  def index
   @order = Order.new
   @orders = Order.all
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
