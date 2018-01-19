class UsersController < ApplicationController
  
  before_action :sign_in_user, only: [:show, :edit, :update, :index, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:destroy] 
  before_action :selfkill_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 4)
    @post = @user.posts.build
    @posts = @user.posts.order(created_at: :desc)
    @categories = @user.categories.uniq 
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
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User #{@user.name} successfully removed from db."
    redirect_to users_path
  end

  def following
    @title = "Follows"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page], per_page: 4)
    render 'following'
  end

  def followers
    @title = "Followed"
    @user = User.find(params[:id])
    @users =@user.followers.paginate(page: params[:page], per_page: 4)    
    render 'following'
  end



  private
   
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def sign_in_user
      unless signed_in?  
        session[:prev_path] = request.url if request.get?
        flash[:notice] = "Plese, Sign in"
        redirect_to '/signin'
      
      end
    end

    def admin_user
      @user = User.find(params[:id])
      unless user_admin? || current_user?(@user)
      flash[:error] = "Only Admin may remove users"
      redirect_to root_path
      end
    end
  
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
    flash[:error] = "You can not modify another user"
    redirect_to root_path
    end
  end
  
  def selfkill_admin
    if user_admin?
    @user = User.find(params[:id])
    unless !current_user?(@user)
    flash[:notice] = "Don't kill yourself!"
    redirect_to request.referer
    end
  end
  end


end
