require 'spec_helper'

describe User do
  
  before(:each) do
   	@admin = Factory(:admin)
  	@website = @admin.websites.find(1)
  	@user = @website.users.create(:email => "jay@example.edu")
  end
  
  it "should require an email" do
  	user = @website.users.create
  	user.should_not be_valid
  end
  
  it "should create a link for user when user is created" do  	
  	@user.link.should_not == nil
  end
  
   it "should increment signups" do
  	@user.increment_clicks
  	@user.clicks.should == 1
  end
  
  it "should increment signups" do
  	@user.increment_signups
  	@user.signups.should == 1
  end
end
