class User < ActiveRecord::Base
    has_many :favorites
    has_many :books, through: :favorites
    has_secure_password
end 