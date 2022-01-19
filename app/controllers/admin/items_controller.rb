class Admin::ItemsController < ApplicationController
  
  def new
  @item = Item.new
  @genres = Genre.all
  end
 
  def index
   @item = Item.new
   @items = Item.all
   @genre = Genre.all
  end
  
  def show
   @genre = Genre.new
   @item = Item.find(params[:id])
   @genres = @item.genre
  end
  
  def edit
   @item = Item.find(params[:id])
   @genres = Genre.all
   
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "successfully"
        redirect_to  admin_items_path(@item)
    else
      @items = Item.all
      render :index
    end  
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
     flash[:notice] = "successfully" 
     redirect_to  admin_items_path(@item.id)
    else
      flash[:notice] = "error" 
      render :edit
    end
  end

 
  private
   
  def item_params
   params.require(:item).permit(:genre_id, :image, :name, :introduction, :price, :is_active)
  end
end
