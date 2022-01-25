class Public::OrdersController < ApplicationController
  
  def new
   @order = Order.new
   @address = Address.new
   @addresses = @addresses.all
  end
end
