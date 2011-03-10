Given /^I am logged in as an administrator$/ do
  Given "I am on the homepage"
  And "I fill in \"Email\" with \"admin@example.com\""
  And "I fill in \"Password\" with \"password\""
 	When "I press \"Sign up\""
end


Then /^my website header should be "([^"]*)"$/ do |header|
  Admin.first.websites.first.header.should == header
end

Then /^my website content should be "([^"]*)"$/ do |content|
  Admin.first.websites.first.content.should == content
end

