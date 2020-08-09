class FavoritesController < ApplicationController 

    get '/favorites/new' do 
        @favorites = Book.all
        erb :'/favorites/new'
    end 

    get '/favorites/:id' do 
        @favorite = Favorite.find_by_id(params[:id]) 
        erb :'/favorites/show'
    end 

    post '/favorites' do 
        book_title = params[:title]
        book_author = Book.find_by_title(book_title).author
        userid = current_user.id
        bookid = Book.find_by_title(book_title).id
        @favorite = Favorite.create(title: book_title, author: book_author, user_id: userid, book_id: bookid)
        redirect "/favorites/#{@favorite.id}"
    end 


end 