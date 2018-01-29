class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    
    @posts = Category.find(params[:id]).posts
    
  end

end
