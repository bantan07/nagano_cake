class CreateOrderDetalis < ActiveRecord::Migration[5.2]
  def change
    create_table :order_detalis do |t|

      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :amount
      t.integer :making_status
      t.datetime :created_at
      t.datetime :updated_at 
    end
  end
end
