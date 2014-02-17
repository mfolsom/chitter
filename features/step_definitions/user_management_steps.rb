When(/^I sign up$/) do
  click_link('Sign up')
  fill_in :name, :with => 'Barney Rubble'
  fill_in :username, :with => 'brubble'+ Time.hash.to_s
  fill_in :email, :with => 'brubble@example.com'+ Time.hash.to_s
  fill_in :password, :with => 'yippee'
  fill_in :password_confirmation, :with => 'yippee'
  click_button('Go')
end

When(/^I sign up with mismatching passwords$/) do
  lambda {sign_up("Barney Rubble",
          "brubble"+ Time.hash.to_s,
          "barneyrubble@example.com"+ Time.hash.to_s, 
          "oranges!", 
          "bleh")}
end

When(/^I sign up with an email address that has already been taken$/) do
  click_link('Sign up')
  fill_in :name, :with => 'Barney Rubble'
  fill_in :username, :with => 'brubble'
  fill_in :email, :with => 'brubble@example.com'
  fill_in :password, :with => 'yippee'
  fill_in :password_confirmation, :with => 'yippee'
  click_button('Go')
end

When(/^I sign up with a username that has already been taken$/) do
  click_link('Sign up')
  fill_in :name, :with => 'Barney Rubble'
  fill_in :username, :with => 'brubble'
  fill_in :email, :with => 'brubble@example.com'
  fill_in :password, :with => 'yippee'
  fill_in :password_confirmation, :with => 'yippee'
  click_button('Go')
end

When(/^I log in as an existing user$/) do
  visit('sessions/new')
  fill_in :username, :with => 'brubble'
  fill_in :password, :with => 'yippee'
  click_button('Sign in')
  expect(page).to have_content("Welcome, Barney Rubble")
end

When(/^I log out$/) do
  visit('sessions/new')
  fill_in :username, :with => 'brubble'
  fill_in :password, :with => 'yippee'
  click_button('Sign in')
  click_button('Log out')
end

Then(/^I should see an password error message$/) do
  expect(current_path).to eq('/users')
  expect(page).to have_content("Sorry, your passwords don't match")
end

Then(/^I should see an email error message$/) do
  expect(page).to have_content("We already have that email.")
end

Then(/^I should see a username error message$/) do
  expect(page).to have_content("Sorry that username already exists!")
end

Then(/^I should see "Welcome, Barney Rubble”$/) do
  expect(page).to have_content("Welcome, Barney Rubble")
end

def sign_up(name = 'Barney Rubble',
            username = 'brubble',
            email = "barneyrubble@example.com", 
            password = "oranges!", 
            password_confirmation = "oranges!")
  visit 'users/new'
  fill_in :name, :with => name
  fill_in :username, :with => username
  fill_in :email, :with => email
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button('Go')
end

def login(username = 'brubble', password = 'yippee')
  visit('sessions/new')
  fill_in :username, :with => username
  fill_in :password, :with => password
  click_button('Sign in')
end

