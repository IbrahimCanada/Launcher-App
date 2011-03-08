class AdminsController < ApplicationController
  def new
  	@admin = Admin.new
  end
  
  def create
  	@admin = Admin.new(params[:admin])
  	if @admin.save
  		flash[:success] = "Admin account created!"
  		sign_in @admin
  		redirect_to admin_path(@admin)
  	else
  		#flash[:notice] = "Account not created!"
  		flash[:error] = "Sign up not successful. " + @admin.errors.full_messages[0]
			redirect_to root_path
  	end
  end
  
  def show
  	@admin = Admin.find(params[:id])
  end

end
