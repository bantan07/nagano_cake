class Admin::HomesController < ApplicationController
  
  def top
   @drder = Order.new
   @orders = Order.all
   @customer = Customer.all
  end
end
