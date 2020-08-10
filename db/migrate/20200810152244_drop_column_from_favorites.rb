class DropColumnFromFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :title, :author
  end
end
