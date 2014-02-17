Feature: Log In

In order to peep pictures of my breakfast
as an avid peeper
I want to log in

Scenario: new user

Given I am on the homepage
When I log in as an existing user
Then I should see "Welcome, Barney Rubble"