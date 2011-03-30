class InvitationsController < ApplicationController

	def invite
		@friend_email = params[:friend_email]
		@user = User.find(params[:user])
		@website = Website.find(params[:website])
		flash[:notice] = "Your friend has been invited! #{@friend_email}"
		FriendMailer.invite_email(@friend_email, @user.email, @user.link, @website.url).deliver
		redirect_to root_path
	end
	
end
