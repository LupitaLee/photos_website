
class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
    end

    get '/' do 
        erb :welcome
    end







    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
             # memoization
            @current_user ||= User.find_by_id(session["user_id"])
		end

        def redirect_if_not_logged_in
            redirect "/login" if !logged_in?
        end

        def redirect_if_logged_in
            redirect "/photo" if logged_in?
        end

        
	end




   

    
end