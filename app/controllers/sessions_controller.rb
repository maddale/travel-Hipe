class SessionsController < ApplicationController
# include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if !user 
      flash.now[:error] = "User's mail #{params[:session][:email]} hasn't been found ((("
      render 'new'    
    else
      if user.authenticate(params[:session][:password])
        flash[:success] = "Welcome back, #{user.name}!!!"
        sign_in user
        redirect_to user
      else
        flash.now[:error] = "Wrong password"
        render 'new'
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end





  #  user = User.find_by_email(email: params[:sessions][:email].downcase)
  #  if !user 
  #    flash[:error] = "User hasn't been found ((("
  #  render 'new'    
  # else
  # if user.authentificate(params[:session][:password])
  #  flash.now[:success] = "Welcome back, #{user.name}!!!"
  #   render 'new'  
  #  else
  #    flash[:error] = "Wrong password"
  #   render 'new'
  #  end
  #  end