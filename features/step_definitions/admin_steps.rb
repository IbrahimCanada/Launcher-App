require 'sessions_helper'

Given /^there is an admin with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  Admin.create!( :email => email, :password => password )
end

Then /^there should be an admin with email "([^"]*)"$/ do |email|
  Admin.find_by_email(email).should_not be_nil 
end

#Then /^"([^"]*)" should be logged in$/ do |email|   I couldn't get this to work!
#  Admin.authenticate_with_salt(cookies[:remember_token]).email.should == email
#end

