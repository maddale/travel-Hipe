class PostsController < ApplicationController
  layout "right_side_bar"
  before_action :correct_user, only: [:edit, :update, :destroy, :gallery]

  def index
    @posts = Post.all
     respond_to do |format|
      format.json { render @posts }
     end
  end

  def new
    @sign = "Create new post"
    @post = current_user.posts.build
    @places = @post.places
    render "edit"
  end

  def create
    @post = current_user.posts.build(post_params)
    @user = @post.user
    if @post.save
      flash[:success] = "Posted successfuly!"
      redirect_to user_path(@user)
    else
      @categories = @user.categories.uniq
      @posts = current_user.posts.order(created_at: :desc)
      render "users/show"
    end
  end

  def show
    @post = Post.find(params[:id])
    @places = @post.places
    @post.increment(:shows)
    @post.save
  end

  def edit
    @sign = "Edit post"
    @post = Post.find(params[:id])  
    @places = @post.places
  end

  def pdate
    @post = Post.find(params[:id])
    places_params = params[:places]

    @post.places.clear
    places_params.keys.each do |key|
      @post.places << Place.where(ident: places_params[key][:ident]).first_or_create do |new_place|
        new_place.name = places_params[key][:name]
      end
    end

    if @post.update_attributes(post_params)
      redirect_to post_path(@post) 
    else
      render 'edit'
    end
  
  end

  def destroy
  Post.find(params[:id]).destroy
  redirect_to root_path
  end

  def gallery
    
    @photos = @user.photos 
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_img, :category_id, :all_tags)
  end

  def correct_user
    @user = User.find(params[:user_id])
    unless current_user?(@user)
      flash[:danger] = "Access to this post is denied."
      redirect_to root_path
    end
  end
end
