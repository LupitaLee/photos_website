class UsersController < ApplicationController
 #here ill have the signup,Log in,sign out

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
     @user = User.new(username: params[:username],email: params[:email], password: params[:password])
        #your code here!
        
        @user.save
        session["user_id"] = user.id
            redirect "/login"
        
    end

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        if params[:username] == "" || params[:password] == ""
            redirect '/login'
        else
            user = User.find_by(username: params[:username])
            user && user.authenticate(params[:password])
            session[:user_id] = user.id
      
            redirect "/account"
        end
        
    end

    
    delete '/logout' do
        session.clear
        redirect "/login"
    end
    

    

end