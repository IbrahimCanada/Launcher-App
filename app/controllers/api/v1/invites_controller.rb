class Api::V1::InvitesController < ActionController::Base
	respond_to :json, :xml
	
	def show
		@admin = Admin.find_by_api_key(params[:api_key])
		@website = @admin.websites.first #change this when an admin can have more than one website
		@user = User.find_by_email_and_website_id(params[:email], @website)
		puts "Howdy #{params}"
		if @user
			respond_to do |format|
      	format.json { render :json => @user.invite }
      	format.xml { render :xml => @user.invite.to_s }
    	end
		else
			render :text => "No such user for that website\n", :status => 404
		end
	end
	
end

