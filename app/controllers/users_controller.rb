class UsersController < ApplicationController
 #here ill have the signup,Log in,sign out

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        
     @user = User.new(username: params[:username],email: params[:email], password: params[:password])
        #your code here!
        # done- validate users input so bad data cannot be persisted to the database.
       
        if !@user.save
            redirect '/signup'  #also flash can go here if user user input wrong password or dind fill in 
        else
        
        session["user_id"] = @user.id
        redirect "/login"
        end
        
    end

    get '/login' do
        redirect_if_logged_in
        erb :'sessions/login'
    end

    post '/login' do
        redirect_if_logged_in
        user = User.find_by(username: params[:username])
            
        if user && user.authenticate(params[:password])
         session["user_id"] = user.id
           
            redirect "/account"
        else 
            redirect "/login"
        end

       
        
    end

  
    get '/logout' do
        redirect_if_not_logged_in
        session.clear
        redirect "/"
    end

    get '/account' do 
        erb :'users/account'
    end
    

    

end