class WebsitesController < ApplicationController
  def show
  	@website = Website.find_by_url(params[:url]) || @website = Website.find(params[:id])
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
