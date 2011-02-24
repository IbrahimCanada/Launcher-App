require 'spec_helper'

describe AdminsController do

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST 'create'" do
  	
  	describe "success" do
  	
  		before(:each) do
        @attr = { :email => "admin@example.com",
                  :encrypted_password => "password" }
      end
      
      it "should create an admin" do
        lambda do
          post :create, :admin => @attr
        end.should change(Admin, :count).by(1)
      end
  	
  	
  	end
  	
  	describe "failure" do
  	
  		it "should not create an admin without an email" do
  			lambda do
  				post :create, :admin => { :encrypted_password => "password" }
  			end.should_not change(Admin, :count).by(1)
  		end
  		
  		it "should not create an admin without a password" do
  			lambda do
  				post :create, :admin => { :email => "admin@example.org" }
  			end.should_not change(Admin, :count).by(1)
  		end
  	end
	
	end

end
