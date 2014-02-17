Feature: Sign Up

In order to take advantage of all of the exciting chitter features
as a new peeper
I want to sign up for the first time

Scenario: new user

Given I am on the homepage
When I sign up
Then I should see "Welcome, Barney Rubble"

Scenario: with email address already taken

Given I am on the homepage
When I sign up with an email address that has already been taken
Then I should see an email error message

Scenario: with a username already taken

Given I am on the homepage
When I sign up with a username that has already been taken
Then I should see a username error message

Scenario: logging in

Given I am on the homepage
When I log in as an existing user
Then I should see "Welcome, Barney Rubble”
