class Admin::OrderDetailsController < ApplicationController

 def update
  @order_detail = OrderDetail.find(params[:id])
     if @order_detail_params.update(order_detail_params_params)
     flash[:notice] = "successfully"
     redirect_to  admin_order_path(@order_detail.id)
     else
      render :show
     end  
 end

 def order_detail_params
   params.require(:order_detail).permit(:makeing_status)
 end
   
end
