class RemoveCommentsRow < ActiveRecord::Migration
  def change
    remove_column :favorites, :comments
  end
end
