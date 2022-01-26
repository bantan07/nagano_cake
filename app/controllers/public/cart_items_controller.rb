class Public::CartItemsController < ApplicationController
  
  def index
   @cart_item = CartItem.new
   @cart_items = CartItem.all
   @item = Item.all
   @order = Order.new
  # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      flash[:notice] = "successfully"
        redirect_to cart_items_path
    else
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
   @cart_item = CartItem.destroy_all
   redirect_to cart_items_path
  end
  
  private
   
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :customer_id, :amount, :name, :image)
  end
end