class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

     t.string :genre_id
     t.string :name
     t.string :image_id
     t.text :introduction
     t.string :pricet
     t.boolean :is_active
     t.datetime :created_at
     t.datetime :updated_at 

    end
  end
end
