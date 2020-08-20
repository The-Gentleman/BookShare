class FavoritesController < ApplicationController 
#               CREATE
    get '/favorites/new' do 
        @books = Book.all.sort_by{|book| book.title}
        erb :'/favorites/new'
    end 

    post '/favorites' do 
        if params[:title_ids] != nil
            ids = params[:title_ids].map{|id| id.to_i}
            ids.each do |id|
                @favorite = Favorite.find_or_create_by(user_id: current_user.id, book_id: id)
            end 
            flash[:success] = "Books successfully added."
            redirect to "/favorites/#{@favorite.id}"
        else 
            flash[:error] = "You need to add stuff to your favorites list! At least one stuff."
            redirect to '/favorites/new'
        end 
    end 

#               READ
    # show all current user favorites   
    get '/favorites' do 
        @favorites = current_user.favorites
        erb :'/favorites/index'
    end 

    # show a single favorite
    get '/favorites/:id' do 
        find_favorite
        erb :'/favorites/show'
    end 
        
#               UPDATE 
    get '/favorites/:id/edit' do 
        current_user_fav_id = current_user.favorites.map{|fav| fav.id}
        if current_user_fav_id.include?(params[:id].to_i)
            find_favorite
            erb :'/favorites/edit'
        else 
            flash[:error] = "You are not authorized to make this edit."
            redirect to "/favorites"
        end 
        # 487, 488, 489, 490
    end 

    patch '/favorites/:id' do 
        if params[:title_id] != nil
            @favorite = find_favorite
            @favorite.update(user_id: current_user.id, book_id: params[:title_id].to_i)
            flash[:success] = "Book successfully edited."
            redirect to "/favorites/#{@favorite.id}"        
        else 
            flash[:error] = "You need to add a book to your edit list!"
            redirect to '/favorites/new'
        end 
    end 

    #               DELETE
    delete '/favorites/:id' do 
        current_user_fav_id = current_user.favorites.map{|fav| fav.id}
        if current_user_fav_id.include?(params[:id].to_i)
            find_favorite.destroy
            flash[:success] = "Book successfully deleted."
            redirect to '/favorites'
        else 
            flash[:error] = "You are not authorized to delete."
            redirect to "/favorites"
        end 
    end 


end 

