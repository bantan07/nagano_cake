class Admin::OrderDetailsController < ApplicationController

 def update
  @order_detali = OrderDetali.find(params[:id])
     if @order_detali.update(order_detail_params)
     flash[:notice] = "successfully"
     redirect_to  request.referer
     else
      render :show
     end  
 end

 def order_detail_params
   params.require(:order_detali).permit(:making_status)
 end
   
end
