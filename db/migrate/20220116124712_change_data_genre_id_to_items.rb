class ChangeDataGenreIdToItems < ActiveRecord::Migration[5.2]
  def change
   change_column :items, :genre_id, :integer
  end
end
