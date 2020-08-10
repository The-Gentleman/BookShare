class FavoritesController < ApplicationController 
#               CREATE
    get '/favorites/new' do 
        @books = Book.all
        erb :'/favorites/new'
    end 

    post '/favorites' do 
        # iterate through params hash
        # access title ids to create favorite
        params.each do |k,v|
            if v.class == Array
                v.each do |id|
                    Favorite.find_or_create_by(user_id: current_user.id, book_id: id.to_i, comments: params[:comments])
                end 
            end 
        end
        redirect to "/favorites/show"
    end 

#               READ
   
    get '/favorites/:id' do 
        @favorite = Favorite.find_by_user_id(current_user.id)
        erb :'/favorites/show'
    end 
#               UPDATE 

    # get  '/favorites/:id/edit' do
    #     @favorite = Favorite.find(params[:id])
    #     erb :'/favorites/edit'
    # end 

    # patch '/favorites/:id' do 
    #     @favorite = Favorite.find(params[:id])
    #     params[:title_ids].each do |id|
    #         @favorite.update(user_id: current_user.id, book_id: id)
    #     end 
    #     redirect to "/favorites/show"
    # end 


end 