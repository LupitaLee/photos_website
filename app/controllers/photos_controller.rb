
class PhotosController < ApplicationController

    get '/account' do 
        @photos = Photo.all 
       
        erb :'/users/account'
    end

end