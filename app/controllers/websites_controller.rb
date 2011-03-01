class WebsitesController < ApplicationController
  def show
  	@website = Website.find(params[:id])
  end

end
