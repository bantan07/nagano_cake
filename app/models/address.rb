class Address < ApplicationRecord

 belongs_to :customer
 
 def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
 end

 validates :address, presence: true
 validates :postal_code, presence: true
 validates :name, presence: true
end
