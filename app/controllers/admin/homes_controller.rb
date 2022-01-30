class Admin::HomesController < ApplicationController
  
  def top
   @orderdetali = OrderDetali.new
   @order_detalis = OrderDetali.all
  end
end
