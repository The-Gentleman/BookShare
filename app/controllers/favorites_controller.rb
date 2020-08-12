class FavoritesController < ApplicationController 
#               CREATE
    get '/favorites/new' do 
        @books = Book.all
        erb :'/favorites/new'
    end 

    post '/favorites' do 
        ids = params[:title_ids]
        ids.each do |id|
            favorite = Favorite.find_or_create_by(user_id: current_user.id, book_id: id.to_i)
            favorite.update(comments: params[:comments])
        end 
        redirect to '/favorites/show'
    end 

#               READ
   
    get '/favorites/:id' do 
        @favorite = Favorite.find_by_user_id(current_user.id)
        erb :'/favorites/show'
    end 
#               UPDATE 



end 