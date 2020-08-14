class FavoritesController < ApplicationController 
#               CREATE
    get '/favorites/new' do 
        @books = Book.all
        erb :'/favorites/new'
    end 

    post '/favorites' do 
        if params[:title_ids] != nil
            ids = params[:title_ids].map{|id| id.to_i}
            ids.each do |id|
                favorite = Favorite.find_or_create_by(user_id: current_user.id, book_id: id)
            end 
            flash[:success] = "Books successfully added."
            redirect to '/favorites/show'
        else 
            flash[:error] = "You need to add stuff to your favorites list! At least one stuff."
            redirect to '/favorites/new'
        end 
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
        @favorite = Favorite.update(@favorite.id, user_id: current_user.id, book_id: params[:title_id].to_i)
        redirect to '/favorites/show'
    end 

    #               DELETE

    get '/favorites/:id/delete' do 
        @favorite = Favorite.find(params[:id])
        erb :'/favorites/delete'
    end 

    delete '/favorites/:id' do
        Favorite.find(params[:id]).destroy
        redirect to '/favorites/show'
    end 

end 



