require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "POST create" do
  
  	describe "with valid email and password" do
    
      before(:each) do
        @admin = Factory(:admin)
        @attr = { :email => @admin.email, :password => @admin.password }
      end

      it "should sign the admin in" do
        post :create, :session => @attr
        controller.current_admin.should == @admin
        controller.should be_signed_in
      end

      it "should redirect to the admins show page" do
        post :create, :session => @attr
        response.should redirect_to admin_path(@admin)
      end
      
   	end
	end
end
