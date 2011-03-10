Feature: Website edit
  In order edit website
  As an admin
  I want to be able to customize my website
  
  Scenario: Basic edit
  	Given I am logged in as an administrator
  	And I go to my website
  	And I follow "Edit"
  	And I fill in "Header" with "header"
  	And I fill in "Content" with "content"
  	When I press "Submit"
  	Then my website header should be "header"
  	And my website content should be "content"
