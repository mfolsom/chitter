Feature: Sign Up

In order to take advantage of all of the exciting chitter features
as a new peeper
I want to sign up for the first time

Scenario: new user signing up

Given I am on the homepage
When I sign up
Then I should see "Welcome, Barney Rubble"