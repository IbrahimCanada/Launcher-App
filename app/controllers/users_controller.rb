class UsersController < ApplicationController
  def create
	  @website = Website.find(params[:user][:website])
	  if User.find_by_email(params[:user][:email]) && User.find_by_email(params[:user][:email]).website == @website
	  	@user = User.find_by_email(params[:user][:email])
	  else
			@user = @website.users.create( :email => params[:user][:email] ) 	
			#cookies.permanent[:user] = @user.id
			if cookies[:referrer]
				@referrer = User.find(cookies[:referrer])
		 		@referrer.increment_signups
			end
			if @user.save
				flash[:success] = "You're all signed up! You're link is http://getyourlaunchbox.com/" + @user.link  		
			else
				flash[:error] = "Sign up not successful. " + @user.errors.full_messages[0]
			end
		end
  	flash[:user_show] = @user.id
  	redirect_to :controller => 'websites', :action => 'show', :id => @website #, :user_show => @user.id
  end

end
