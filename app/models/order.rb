class Order < ApplicationRecord
   
   has_many :order_details
   belongs_to :customer
   
   enum status: {
     "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済":4
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
