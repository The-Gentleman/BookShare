class AddCommentsToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :comments, :text
  end
end
