Feature: Admin sign up and sign in
  In order use LaunchBox
  As an admin
  I want to be able to sign up and sign in and sign out
  
  Scenario: Successful sign up
  	Given I am on the homepage
  	And I fill in "Email" with "admin@example.com"
  	And I fill in "Password" with "password"
  	When I press "Sign up"
  	Then there should be an admin with email "admin@example.com"
  	
  Scenario: Be able to get from homepage to sign in page
  	Given I am on the homepage
  	When I follow "Sign in"
  	Then I should be on the sign in page
  	
  Scenario: Be able to sign in from sign in page 
  	Given I am on the sign in page
  	And there is an admin with email "admin@example.com" and password "password"
  	And I fill in "Email" with "admin@example.com"
  	And I fill in "Password" with "password"
  	When I press "Sign in"
  	Then I should see "admin@example.com"
  	
  Scenario: Be able to sign out from admin page
	  Given I am on the sign in page
  	And there is an admin with email "admin@example.com" and password "password"
  	And I fill in "Email" with "admin@example.com"
  	And I fill in "Password" with "password"
  	And I press "Sign in"
  	When I follow "Sign out"
  	Then I should be on the homepage
