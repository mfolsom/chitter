When(/^I sign up$/) do
  click_link('Sign up')
  fill_in :name, :with => 'Barney Rubble'
  fill_in :username, :with => 'brubble'
  fill_in :email, :with => 'brubble@example.com'
  fill_in :password, :with => 'yippee'
  fill_in :password_confirmation, :with => 'yippee'
  click_button('Go')
end