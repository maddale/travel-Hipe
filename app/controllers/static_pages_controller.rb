class StaticPagesController < ApplicationController
  
  def home
  	if signed_in?
        # @feed_items = current_user.feed.paginate(page: params[:page], per_page: 6)
        @posts = Post.order(updated_at: :desc)
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
