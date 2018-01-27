class RelationshipsController < ApplicationController

	def create
		@user = User.find_by(id: params[:relationship][:followed_id])
#	render 'shared/debug'
		current_user.relationships.create!(followed_id: @user.id)
		redirect_to @user
	end

	
	def destroy
		@user = User.find(params[:relationship][:followed_id])
		current_user.unfollow!(@user)
		redirect_to @user

	end
end