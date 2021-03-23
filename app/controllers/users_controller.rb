class UsersController < ApplicationController
 #here ill have the signup,Log in,sign out

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
     @user = User.new(username: params[:username],email: params[:email], password: params[:password])
        #your code here!
        @user.save
            redirect "/login"
        
    end

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
    end

    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end


end