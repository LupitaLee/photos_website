
class PhotosController < ApplicationController

    get '/photos' do 
        redirect_if_not_logged_in
       @photos = current_user.photos
        
        erb :'photos/index'
        
    end
    # CREATE new photo (render form)
    get '/photos/new' do 
        
        redirect_if_not_logged_in
        erb :'photos/new'
    end



      # CREATE 1 photo
    post '/photos' do

        redirect_if_not_logged_in
        photo = current_user.photos.build(params[:photo])
        if photo.save
            redirect to "/photos/#{photo.id}"
        else     # movie.errors coming from active record. when the validation on save  fails is going to give that error.
            flash[:error] = "#{photo.errors.full_messages.join(",")}"
            redirect to "/photos/new"
        end


    
    end


     # see 1 photo
    get '/photos/:id' do
        
        redirect_if_not_logged_in
        redirect_if_not_authorized
        
        erb :'photos/show'
    end

  


#update 1 photo (render form)
    get '/photos/:id/edit' do
        redirect_if_not_logged_in
        redirect_if_not_authorized
       
        erb :'photos/edit'
    end
#update 1 photo (save in db)
    patch '/photos/:id' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized

        if @photo.update(params["photo"])
            redirect to "/photos/#{@photo.id}"
        else
            redirect to "/photos/#{@photo.id}/edit"
        end
        

    end
     # DELETE 1 photo
    delete '/photos/:id' do 
        redirect_if_not_logged_in
        redirect_if_not_authorized

        @photo.destroy

        redirect to '/photos'
    end



  def redirect_if_not_authorized
      @photo = Photo.find_by_id(params[:id])
      if @photo.user_id != session["user_id"]
        redirect to "/photos"
        
      end
  end
    


   

end