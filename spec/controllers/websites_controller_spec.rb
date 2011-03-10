require 'spec_helper'

describe WebsitesController do

  before(:each) do
  	@admin = Factory(:admin)
  	@website = @admin.websites.find(1)
  end
  
  describe "show" do
  
		it "should get website by websites path" do
			get :show, :id => @website
			response.should be_successful
		end
		
		it "should get website by admins link" do
			get :show, :url => @website.url
			response.should be_successful
		end
		
		it "should get website using a users link" do
			@user = @website.users.create( :email => "user@example.net" )
			get :show, :url => @user.link
			response.should be_successful
		end
  	
		it "should respond gracefully to non-existent url" do
			get :show, :url => "nosuchurl"
			response.should redirect_to root_path
		end

	end
	
	describe "GET edit" do
	
		it "should be successful" do
			get :edit, :id => @website
			response.should be_successful
		end
	end
		
	describe "PUT update" do
	
		it "should update website and redirect to website path" do
			@attr = { :header => "Header", :content => "A lot of great content!" }
			put :update, :id => @website, :website => @attr
			@website.reload
			@website.header.should == "Header"
			@website.content.should == "A lot of great content!"
			response.should redirect_to website_path(@website)
		end
		
		it "should go to edit page upon update failure" do
			@attr = { :url => " " }
			put :update, :id => @website, :website => @attr	
			response.should render_template('edit')
		end
	end
	
	describe "GET followers" do
		
		it "should render followers page" do	
			get :followers, :id => @website
			response.should render_template('followers')
		end
		
	end
	
end
