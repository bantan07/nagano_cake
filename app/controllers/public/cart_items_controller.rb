class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
   @cart_item = CartItem.new
   @cart_items = current_customer.cart_items
   @item = Item.all
   @order = Order.new
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "successfully"
        redirect_to cart_items_path
    else
      flash[:notice] = "error"
      @cart_items = CartItem.all
      render :index
    end  
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
     flash[:notice] = "successfully" 
     redirect_to cart_items_path(@cart_item.id)
    else
      flash[:notice] = "error" 
      render :index
    end
  end
  
  def destroy_all
  CartItem.destroy_all
   redirect_to cart_items_path
  end
  
  def destroy
   @cart_item = CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end
  private
   
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :customer_id, :amount, :name, :image, :shoppind)
  end
end