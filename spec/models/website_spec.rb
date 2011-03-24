require 'spec_helper'

describe Website do
  
  it "should create a new instance given valid attributes" do
		Website.create!(:url => "qwerty")
	end
	
	
	it "should belong to an admin" do
		@attr = { :email => "admin@example.com", :password => "password" }
		admin = Admin.create!(@attr)
		site = admin.websites.create(:url => "qwerty")
		site.admin.should_not be_nil
	end
	

end
