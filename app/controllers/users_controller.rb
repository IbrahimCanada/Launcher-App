class UsersController < ApplicationController
  def create
	  @website = Website.find(params[:user][:website])
	  if User.find_by_email_and_website_id(params[:user][:email], @website) #User.find_by_email(params[:user][:email]) && User.find_by_email(params[:user][:email]).website == @website
	  	@user = User.find_by_email_and_website_id(params[:user][:email], @website)
	  else
			@user = @website.users.create( :email => params[:user][:email] ) 	
			if @user.save
				if cookies[:referrer]
					@referrer = User.find(cookies[:referrer])
		 			@referrer.increment_signups
				end
				flash[:success] = "Thanks for signing up!" 	
			else
				flash[:error] = "Sign up not successful. " + @user.errors.full_messages[0]
			end
		end
  	flash[:user_show] = @user.id
  	redirect_to :controller => 'websites', :action => 'show', :id => @website 
  end

end
