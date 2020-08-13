class FavoritesController < ApplicationController 
#               CREATE
    get '/favorites/new' do 
        @books = Book.all
        erb :'/favorites/new'
    end 

    post '/favorites' do 
        ids = params[:title_ids].map{|id| id.to_i}
        ids.each do |id|
            favorite = Favorite.find_or_create_by(user_id: current_user.id, book_id: id)
        end 
        redirect to '/favorites/show'
    end 

#               READ
   
    get '/favorites/:id' do 
        @favorite = Favorite.find_by_user_id(current_user.id)
        erb :'/favorites/show'
    end 
#               UPDATE 

    get '/favorites/:id/edit' do 
        @favorite = Favorite.find_by_user_id(current_user.id)
        erb :'/favorites/edit'
    end 

    patch '/favorites/:id' do 
        @favorite = Favorite.find(params[:id])
        ids = params[:title_ids].map{|id| id.to_i}
        ids.each do |id|
            @favorite = Favorite.update(@favorite.id, user_id: current_user.id, book_id: id)
        end 
        redirect to "/favorites/#{@favorite.id}"
    end 

    #               DELETE

    get '/favorites/:id/delete' do 
        @favorite = Favorite.find(params[:id])
        erb :'/favorites/delete'
    end 

    delete '/favorites/:id' do
        ids = params[:title_ids].map{|id| id.to_i}

        ids.map do |book_id|
            Favorite.find_by(book_id: book_id).destroy
        end 
        redirect to '/favorites/show'
    end 

end 



