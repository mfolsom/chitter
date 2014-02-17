Feature: Posting

In order to bore people with my daily minutiae
As a peeper
I want to post a new peep message


Scenario: posting a new message
  Given I am on the homepage
  When I fill in "peep" with "What's up everyone?"
  And I press "overshare"
  Then I should see "What's up everyone?"

Scenario: messages appear in chronological order
  Given I am on the homepage
  When I fill in "peep" with "What's up everyone?"
  And I press "overshare"
  And I fill in "peep" with "Yo yo is fun"
  And I press "overshare"
  And I fill in "peep" with ""
