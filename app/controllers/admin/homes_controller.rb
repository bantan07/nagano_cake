class Admin::HomesController < ApplicationController
  
  def top
   @order = Order.new
   @orders = Order.all
   @customer = Customer.all
  end
end
