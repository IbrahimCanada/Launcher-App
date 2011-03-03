require 'spec_helper'

describe User do
  
  before(:each) do
   	@admin = Factory(:admin)
  	@website = @admin.websites.find(1)
  end
  
  it "should require an email" do
  	user = @website.users.create
  	user.should_not be_valid
  end
  
  it "should create a link for user when user is created" do
  	user = @website.users.create(:email => "jay@example.edu")
  	user.link.should_not == nil
  end
end
