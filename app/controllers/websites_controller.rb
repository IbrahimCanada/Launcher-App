class WebsitesController < ApplicationController
  def show
  	#@website = Website.find_by_url(params[:url]) || @website = User.find_by_link(params[:url]).website || @website = Website.find(params[:id]) 
  	if Website.find_by_url(params[:url]) != nil
  		@website = Website.find_by_url(params[:url])
  		@user = User.new
  	elsif User.find_by_link(params[:url]) != nil
  		@user = User.find_by_link(params[:url])
  		@user.increment_clicks
  		@website = @user.website
  		@user = User.new
  	elsif Website.find(params[:id]) != nil
  		@website = Website.find(params[:id]) 
  		@user = User.new
  	else
  		flash[:error] = "No such Url!"
  		redirect_to root_path
  	end
  	
  end
  
  #def user_show
  #	@user = User.find(8) #change this!!
  #	@user_show = true
  #	@website = Website.find(params[:id])
  #	render website_path(@website)
  #end
  
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
