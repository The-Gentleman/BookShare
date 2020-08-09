class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string  :title
      t.string  :author 
      t.integer :user_id
      t.integer :book_id
    end 
  end
end
