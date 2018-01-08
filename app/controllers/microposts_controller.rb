class MicropostsController < ApplicationController

before_action :correct_user, only: [:destroy]


def create
	@micropost = current_user.microposts.build(micropost_params)
	if @micropost.save
		flash[:success] = "Post created!"		
		redirect_to root_path
	else
		@feed_items = []
		render 'static_pages/home'
	end
end

def destroy
	@micropost.destroy
	flash[:success] = "Post has been successfully deleted"
	redirect_to current_user
end
	



private
	
	def micropost_params
		params.require(:micropost).permit(:content)
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_path if @micropost.nil?		
	end

end
