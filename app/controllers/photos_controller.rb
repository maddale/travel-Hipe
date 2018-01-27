class PhotosController < ApplicationController

  
  def new
    @user = current_user
    @photo = current_user.photos.build
  
  end

  def create
    @user = User.find(params[:user_id])
    
    if params[:photo][:picture].count == 1
      @photo = @user.photos.build
      @photo.picture = params[:photo][:picture].first
      if  @photo.save
      redirect_to @user
      else
      render 'new'
      end
    else
        params[:photo][:picture].each do |picture|
        u = @user.photos.build
        u.picture = picture
        u.save!        
        end
        redirect_to @user
    end
    
  end


private
  
  def photo_params
    params.require(:photo).permit(:picture)
    
  end

end
