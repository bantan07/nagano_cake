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
   @cart_items = current_customer.cart_items
   @order = current_customer.orders.new(order_params)
   @address = Address.find(params[:order][:address_id])
   if params[:order][:address_option] == "1"
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name
      @order.address = current_customer.address
   elsif params[:order][:address_option] == "2"
      @order.postal_code = @address.postal_code
      @order.name = @address.name 
      @order.address = @address.address
   else 
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
   end
  end
  
  def show
   @order = Order.find(params[:id])
   @order_detalis = @order.order_detalis
   @total=0
   @order_detalis.each do |order_detail|
   @total += order_detail.item.price*order_detail.amount 
   end 
  end
  
  def complete
  end
  
  def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  @order.status = 0
    if @order.save
     flash[:notice] = "successfully"
     current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetali.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.making_status = 0
      if order_detail.save
      else
       render :confirm
      end
    end
     redirect_to orders_complete_path
    else
     flash[:notice] = "error"
     @cart_items = current_customer.cart_items
     @orders = Order.all
     render :confirm
    end
  end
  
   private
   
  def order_params
   params.require(:order).permit(:customer_id, :item_id,:postal_code,  :address, 
   :shipping_cost, :total_payment, :name, :payment_method, :status)
  end
end
