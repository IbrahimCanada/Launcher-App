class WebsitesController < ApplicationController
		
  def show
  	if Website.find_by_url(params[:url]) != nil  #finding website with admin's url
  		@website = Website.find_by_url(params[:url])
  		@new_user = User.new
  	elsif User.find_by_link(params[:url]) != nil #finding website with user's url
  		@user = User.find_by_link(params[:url])
  		cookies[:referrer] = { :value => @user.id, :expires => 1.day.from_now } 
  		@user.increment_clicks
  		@website = @user.website
  		@new_user = User.new
  	elsif Website.find_by_id(params[:id]) != nil       #finding website using standard websites/id
  		@website = Website.find(params[:id]) 
  		@new_user = User.new
  		@user_show = flash[:user_show] #params[:user_show]  
  		@user = User.find(flash[:user_show]) if flash[:user_show]
  	else
  		flash[:error] = "No such Url!"
  		redirect_to root_path
  	end
  	
  end
  
   
  def edit
  	@website = Website.find(params[:id])
  end
  
  def update
  	@website = Website.find(params[:id])
  	if @website.update_attributes(params[:website])
  		flash[:success] = "Website updated!"
  		redirect_to website_path(@website)
  	else
  		flash[:error] = "Website not updated."
  		render 'edit'
  	end
  end
  
  def followers
  	@website = Website.find(params[:id])
  	render 'followers'
  end

end
