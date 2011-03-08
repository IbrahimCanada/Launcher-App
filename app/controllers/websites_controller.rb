class WebsitesController < ApplicationController
  def show
  	if Website.find_by_url(params[:url]) != nil  #finding website with admin's url
  		@website = Website.find_by_url(params[:url])
  		@user = User.new
  	elsif User.find_by_link(params[:url]) != nil #finding website with user's url
  		@user = User.find_by_link(params[:url])
  		cookies[:referrer] = { :value => @user.id, :expires => 1.day.from_now } #@user.id
  		@user.increment_clicks
  		@website = @user.website
  		@user = User.new
  	elsif Website.find(params[:id]) != nil       #finding website using standard websites/id
  		@website = Website.find(params[:id]) 
  		@user = User.new
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

end
