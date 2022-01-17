class RenamePricetColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :pricet, :price
  end
end
