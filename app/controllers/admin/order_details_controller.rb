class Admin::OrderDetailsController < ApplicationController

 def update
 end

 def order_detail_params
   params.require(:order_detali).permit(:order_id, :item_id, :makeing_status, :price, :amount)
 end
   
end
