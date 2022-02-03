class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item, optional: true
  
  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true
  
 def sum_price # 実際に作成したサイトは税金も算出していたのでメソッドを記載していました
  item.taxin_price*quantity
 end  
end
