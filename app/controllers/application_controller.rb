
class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
        use Rack::Flash
    end

    get '/' do 
        erb :search
    end

    get '/search' do
        if params[:title]== ""
            @photos = Photo.all
        else 

        @photos = Photo.all.find_all {|photo| photo.title == params[:title]}
        end
    

        erb :results
       
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
            redirect "/account" if logged_in?
        end

        
	end




   

    
end