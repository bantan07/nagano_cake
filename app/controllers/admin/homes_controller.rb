class Admin::HomesController < ApplicationController
  
  def top
   @odrder = Order.new
   @orders = Order.all
   @customer = Customer.all
  end
end
