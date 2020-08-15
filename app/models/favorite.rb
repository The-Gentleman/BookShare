class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :book 

    validates :book_id, presence: true
end 