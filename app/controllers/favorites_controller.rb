class FavoritesController < ApplicationController 
#               CREATE
    get '/favorites/new' do 
        @books = Book.all
        erb :'/favorites/new'
    end 


    post '/favorites' do 
        # iterate through params hash
        params.each do |param| #= {"title_ids"=>["1", "2"]}
        # iterate through inner array with the IDs 
            param[1].each do |fav_id|
        # use current_user.id and second element, the array of IDs, to create favorite
                @fav = Favorite.find_or_create_by(user_id: current_user.id, book_id: fav_id)
            end  
        end 
        # binding.pry

        redirect to "/favorites/#{@fav.id}"
    end 

    get '/favorites/user' do 
        erb :'/favorites/user_favorites'
    end 

#               READ
    get '/favorites/:id' do 
        @favorite = Favorite.find_by_id(params[:id]) 
        erb :'/favorites/show'
    end 



end 