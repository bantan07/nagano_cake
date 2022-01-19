class Public::CartItemsController < ApplicationController
  
  def index
   @item = Item.new
   @items = Item.all
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "successfully"
        redirect_to cart_items_path(@item)
    else
      @items = Item.all
      render :index
    end  
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     flash[:notice] = "successfully" 
     redirect_to cart_items_path(@item.id)
    else
      flash[:notice] = "error" 
      render :index
    end
  end
  
  private
   
  def item_params
   params.require(:item).permit(:image, :name, :amount, :price, :is_active)
  end
end
