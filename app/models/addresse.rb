class Addresse < ApplicationRecord
  
 validates :address, presence: true
 validates :postal_code, presence: true
 validates :name, presence: true
end
