class InvitationsController < ApplicationController

	def invite
		@friend_emails = params[:friend_email].split(',')
		@user = User.find(params[:user])
		@website = Website.find(params[:website])
		flash[:notice] = "Your friends have been invited!"
		@friend_emails.each do |friend_email|
			FriendMailer.invite_email(friend_email, @user.email, @user.link, @website.url).deliver
		end
		flash[:user_show] = @user.id
		redirect_to website_path(@website)
	end
	
end
