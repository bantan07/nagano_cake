class Public::ItemsController < ApplicationController
 
  def index
   @item = Item.new
   @items = Item.all
  end
  
  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
  end
  
  private
   
  def item_params
   params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :amount, :is_active)
  end
end
