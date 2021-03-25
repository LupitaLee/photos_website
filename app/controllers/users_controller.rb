class UsersController < ApplicationController
 #here ill have the signup,Log in,sign out

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        
     @user = User.new(username: params[:username],email: params[:email], password: params[:password])
        #your code here!
        # done- validate users input so bad data cannot be persisted to the database.

        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'  #also flash can go here if user user input wrong password or dind fill in 
        else
        @user.save
        session["user_id"] = @user.id
        redirect "/login"
        end
        
    end

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        if params[:username] == "" || params[:password] == ""
            redirect '/login'
        else
            user = User.find_by(username: params[:username])
            
            if user && user.authenticate(params[:password])
            session["user_id"] = user.id
           
            redirect "/account"
            else 
            redirect "/login"
            end

        end
        
    end

  
    get '/logout' do
        session.clear
        redirect "/"
    end

    get '/account' do 
        erb :'users/account'
    end
    

    

end