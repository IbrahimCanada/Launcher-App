require 'spec_helper'

describe Website do
  
  it "should create a new instance given valid attributes" do
		Website.create!(:url => "qwerty")
	end
	
#	it "should require a url" do
#		no_url_website = Website.new()
#		no_url_website.should_not be_valid
#	end
	
	it "should belong to an admin" do
		@attr = { :email => "admin@example.com", :password => "password" }
		admin = Admin.create!(@attr)
		site = admin.websites.create(:url => "qwerty")
		site.admin.should_not be_nil
	end
	
#	it "url should have 6 alphabetic characters" do
#		site = Website.new(:url => "qwert")
#		site.should_not be_valid
#	end	
end
