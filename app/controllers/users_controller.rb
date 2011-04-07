class UsersController < ApplicationController
  def create
	  @website = Website.find(params[:user][:website])
	  if User.find_by_email_and_website_id(params[:user][:email], @website) 
	  	@user = User.find_by_email_and_website_id(params[:user][:email], @website)
	  else
			@user = @website.users.create( :email => params[:user][:email] ) 	
			if @user.save
				if cookies[:referrer]
					@user.set_referrer_id( User.find(cookies[:referrer]).id )
					cookies.delete(:referrer)
				end
				UserMailer.confirmation_email(@user, @website).deliver
				flash[:notice] = "Please click the confirmation link on an email you will receive shortly to complete sign up process."
			else
				flash[:error] = "Sign up not successful. " + @user.errors.full_messages[0]
			end
		end
  	flash[:user_show] = @user.id if @user.confirmed
  	redirect_to :controller => 'websites', :action => 'show', :id => @website 
  end

	def confirm
		@confirmation_code = params[:confirmation_code]
		@user = User.find_by_confirmation_code(@confirmation_code)
		@website = @user.website
		@user.confirm
		if @user.referrer_id
			User.find(@user.referrer_id).increment_signups
		end
		flash[:success] = "Thanks for signing up!" 
		flash[:user_show] = @user.id
		redirect_to "http://" + @website.domain_name
		#redirect_to :controller => 'websites', :action => 'show', :id => @user.website
	end
end
