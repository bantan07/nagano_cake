class OrderDetali < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
end
