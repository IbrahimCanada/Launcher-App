require 'spec_helper'

describe UsersController do

	describe "POST 'create'" do
  
   	describe "failure" do
		  it "should not create a user if user has no email" do
		      lambda do
		        @admin = Factory(:admin)
		        post :create, :user => { :email => " ", :website => @admin.websites.find(1) }
		      end.should_not change(User, :count).by(1)
		    end
    		
    end	
   
   
  	describe "success" do
  		
  		it "should create a user" do
        lambda do
          @admin = Factory(:admin)
          post :create, :user => { :email => "john@example.com", :website => @admin.websites.find(1) }
        end.should change(User, :count).by(1)
      end
  		
  		
  		
  	end
  end

end
