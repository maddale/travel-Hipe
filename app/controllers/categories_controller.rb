class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @posts = User.find(params[:user_id]).categories.find(params[:id]).posts
    @post  = User.find(params[:user_id]).posts.first
  end

end
