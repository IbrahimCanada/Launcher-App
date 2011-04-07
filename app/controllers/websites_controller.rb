class WebsitesController < ApplicationController
	require 'csv'

  def show
  	if Website.find_by_url(params[:url]) != nil  #finding website with admin's url - this will be accessed by widget
  		@website = Website.find_by_url(params[:url])
  		@new_user = User.new
  		@user_show = flash[:user_show] 
  		@user = User.find(flash[:user_show]) if flash[:user_show]
  		@widget = true
  	elsif User.find_by_link(params[:url]) != nil #finding website with user's url
  		@user = User.find_by_link(params[:url])
  		cookies[:referrer] = { :value => @user.id, :expires => 1.day.from_now } 
  		@user.increment_clicks
  		@website = @user.website
  		redirect_to "http://" + @website.domain_name
  	elsif Website.find_by_id(params[:id]) != nil       #finding website using standard websites/id - will probably deprecate this option
  		@website = Website.find(params[:id]) 
  		@new_user = User.new
  		@user_show = flash[:user_show] 
  		@user = User.find(flash[:user_show]) if flash[:user_show]
  		@widget = true
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
  	@admin = @website.admin
  	if @website.update_attributes(params[:website])
  		flash[:success] = "Website updated!"
  		redirect_to admin_path(@admin)
  	else
  		flash[:error] = "Website not updated."
  		render 'edit'
  	end
  end
  
  def followers
  	@website = Website.find(params[:id])
  	render 'followers'
  end
  
  def csv
  	@website = Website.find(params[:id])
  	export_to_csv(@website)
  end

	private
	
	def export_to_csv(website)
		@users = website.users.all

		csv_string = CSV.generate do |csv|
		  # header row
		  csv << ["Email", "Signups", "Eligible for invite?"]

		  # data rows
		  @users.each do |user|
		    csv << [user.email, user.signups, user.invite_eligible]
		  end
		end

		# send it to the browsah
		send_data csv_string,
		          :type => 'text/csv; charset=iso-8859-1; header=present',
		          :disposition => "attachment; filename=users.csv"
	end
end
