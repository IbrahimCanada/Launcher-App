class AdminsController < ApplicationController
  def new
  	@admin = Admin.new
  end
  
  def create
  	@admin = Admin.new(params[:admin])
  	if @admin.save
  		flash[:success] = "Admin account created!"
  	else
  		flash[:notice] = "Account not created!"
  	end
 		redirect_to root_path
  end

end
