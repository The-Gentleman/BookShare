class DropAuthorColumnFromFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :author
  end
end
