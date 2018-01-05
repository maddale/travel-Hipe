class UsersController < ApplicationController
  
  before_action :sign_in_user, only: [:show, :edit, :update]
 #  before_action :admin_user, 
  
  def index
    @users = User.all
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Welcome to the Travell Hipe!"
      redirect_to @user
    else
      render 'new'
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       redirect_to user_path(params[:id])
       flash[:success] = "Changes have been applied successfully!"
    else
      render 'edit'
    end
  end
  
 

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def sign_in_user
      unless singed_in?
        flash[:notice] = "Plese, Sign Up"
        redirect_to root_path
      end
    end

end
