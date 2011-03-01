class WebsitesController < ApplicationController
  def show
  	@website = Website.find_by_url(params[:url])
  end

end
