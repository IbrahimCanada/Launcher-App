require 'spec_helper'

describe Admin do
  
 	before(:each) do
 		@attr = { :email => "admin@example.com", :encrypted_password => "password" }
		@admin = Admin.create!(@attr)
	end

  it "should have email attribute" do
  	@admin.should respond_to(:email)
  end
  
  it "should have encrypted_password attribute" do
  	@admin.should respond_to(:encrypted_password)
  end
  
  it "should respond to (have) websites" do
  	@admin.websites.create!(:url => "qwerty")
  end
  
  it "should create a new instance given valid attributes" do
		Admin.create!(@attr)
	end

  it "should require an email" do
  	no_email_admin = Admin.create(:encrypted_password => "password")
  	no_email_admin.should_not be_valid
  end
  
  it "should require an encrypted password" do
  	no_password_admin = Admin.create(:email => "admin@example.com")
  	no_password_admin.should_not be_valid
  end
  
  it "should create website for admin after save" do
  	@admin.websites.all.should_not be_empty
  end
end
