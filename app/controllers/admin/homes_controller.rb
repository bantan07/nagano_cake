class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
   @orderdetali = OrderDetali.new
   @order_detalis = OrderDetali.all
  end
end
