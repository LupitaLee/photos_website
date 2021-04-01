
class PhotosController < ApplicationController

    get '/photos' do 
        redirect_if_not_logged_in
       @photos = current_user.photos
        
        erb :'photos/index'
        
    end

    
    get '/photos/new' do 
        
        redirect_if_not_logged_in
        erb :'photos/new'
    end



     
    post '/photos' do

        redirect_if_not_logged_in
        photo = current_user.photos.build(params[:photo])
        if photo.save
            redirect to "/photos/#{photo.id}"
        else    
            flash[:error] = "#{photo.errors.full_messages.join(",")}"
            redirect to "/photos/new"
        end


    
    end


    
    get '/photos/:id' do
        
        redirect_if_not_logged_in
        redirect_if_not_authorized
        
        erb :'photos/show'
    end

  



    get '/photos/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
       
        erb :'photos/edit'
    end

    patch '/photos/:id' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized

        if @photo.update(params["photo"])
            redirect to "/photos/#{@photo.id}"
        else
            redirect to "/photos/#{@photo.id}/edit"
        end
        

    end
   
    delete '/photos/:id' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized

        @photo.destroy

        redirect to '/photos'
    end



  def redirect_if_not_authorized
      @photo = Photo.find_by_id(params[:id])  
      if @photo.user_id != session["user_id"] #current user 
        redirect to "/photos"  
        
      end
  end
    


   

end