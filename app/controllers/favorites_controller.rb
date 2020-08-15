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
    # show all current user favorites   
    get '/favorites' do 
        @favorites = current_user.favorites 
        erb :'/favorites/index'
    end 

    # show a single favorite
    get '/favorites/:id' do #find_favorite runs fine here
        find_favorite
        erb :'/favorites/show'
    end 
        
#               UPDATE 

    get '/favorites/:id/edit' do # favorite/edit form renders fine
        find_favorite
        erb :'/favorites/edit'
    end 

    patch '/favorites/:id' do # this is where I get the error
        if params[:title_id] != nil
            find_favorite
            find_favorite = Favorite.update(@favorite.id, user_id: current_user.id, book_id: params[:title_id].to_i)
            flash[:success] = "Book successfully edited."
            redirect to "/favorites/#{@favorite.id}"
        else 
            flash[:error] = "You need to add stuff to your edit list!"
            redirect to '/favorites/new'
        end 
    end 


    #               DELETE

    get '/favorites/:id/delete' do 
        binding.pry
    end 


end 

