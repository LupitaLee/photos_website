
class PhotosController < ApplicationController

    get '/home' do 
        @photos = Photos.all 
        @photos.map{|p|p.title}.join("-")

end