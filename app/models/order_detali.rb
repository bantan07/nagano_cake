class OrderDetali < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  enum making_status: {
    not_stated:0, waiting_for_production:1, in_production:2,  completion_of_production:3
  }
end
