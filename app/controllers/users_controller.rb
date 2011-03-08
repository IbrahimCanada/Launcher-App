class UsersController < ApplicationController
  def create
	  @website = Website.find(params[:user][:website])
  	@user = @website.users.create( :email => params[:user][:email] ) 	
  	if cookies[:referrer]
	  	@referrer = User.find(cookies[:referrer])
   		@referrer.increment_signups
  	end
  	if @user.save
  		flash[:success] = "You're all signed up!"  		
  	else
  		flash[:error] = "Sign up not successful." + @user.errors.full_messages[0]
  	end
  	redirect_to website_path(@website)
  	#redirect_to :controller => 'websites', :action => 'user_show', :id => @website 
  end

end
