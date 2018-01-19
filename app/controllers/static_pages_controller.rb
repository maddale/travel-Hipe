class StaticPagesController < ApplicationController
  
  def home
  	if signed_in?
        @micropost = current_user.microposts.build
        @feed_items = current_user.feed.paginate(page: params[:page], per_page: 6)
        @posts = current_user.posts.order(updated_at: :desc)
        @post = current_user.posts.first
  end 
  end


  def help
  end
  
  def about
  end

  def contact
  end

end
