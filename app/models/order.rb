class Order < ApplicationRecord
   
   has_many :order_detalis
   belongs_to :customer
   
   enum status: {
     wait_payment:0, confirm_payment:1, now_making:2, prepare_shipment:3, done_shipment:4
  }
  
  enum payment_method: {
    "クレジットカード":0 , "銀行振込":1 
  }
  
   validates :customer_id, presence: true
   validates :postal_code, presence: true
   validates :address, presence: true
   validates :name, presence: true
   validates :shipping_cost, presence: true
   validates :total_payment, presence: true
   validates :payment_method, presence: true
   validates :status, presence: true

end
