
class PhotosController < ApplicationController

    get '/photos' do 
        @photos = Photo.all 
       
        erb :'photos/index'
    end

    get '/photos/new' do 
        # @photos = Photo.new 
       
        erb :'photos/new'
    end


    post '/photos' do
        if current_user
     
        photo = Photo.new(title:params[:title],image_url:params[:image_url],description:params[:description])
       
       
        photo.save
    
        redirect to "/photos/#{photo.id}"
        else 
        redirect to "/photos"
        end

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