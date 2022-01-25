class Order < ApplicationRecord
   
   has_many :order_details
   belongs_to :customer
   
   validates :customer_id, presence: true
   validates :postal_code, presence: true
   validates :address, presence: true
   validates :name, presence: true
   validates :shipping_cost, presence: true
   validates :total_payment, presence: true
   validates :payment_method, presence: true
   validates :status, presence: true

end
