class UsersController < ApplicationController

    get '/login' do 
        erb :'/login'
    end 

    post '/login' do 
        @user = User.find_by_username(params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:success] = "Greetings, #{@user.username}, Noble One."
            redirect to "/users/#{@user.id}"
        else 
            flash[:error] = "You new here? You need to make an account to gain entry."
            redirect to '/login'
        end 
    end 

    get '/users/:id' do 
        @user = current_user.username
        erb :'/users/show'
    end 

    get '/signup' do 
        erb :'/users/signup'
    end 

    post '/signup' do 
        @user = User.create(params)
        session[:id] = @user.id
        redirect to "/login"
    end 

    get '/logout' do 
        session.clear
        redirect to '/'
    end 
end 