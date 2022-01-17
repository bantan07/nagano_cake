class Item < ApplicationRecord
  
 belongs_to :genre
 attachment :image
 
 def add_tax_price
  (self.price.to_i * 1.08).round
 end

 
end
