
class PhotosController < ApplicationController

    get '/photos' do 
        @photos = Photo.all 
       
        erb :'photos/index'
    end

    get '/photos/new' do 
        @photos = Photo.new 
       
        erb :'photos/new'
    end


    post '/photos' do
      
        @photo = Photo.new(params["title"],params["image_url"],params["description"])
    
        redirect to "/photos/#{@photo.id}"
    end

    get '/photos/:id' do
        @photo = Photo.find_by(params[:id])
        erb :'photos/show'
    end



    get '/photos/:id/edit' do
        @photos = Photo.find(params[:id])
        erb :edit
    end


   

end