require 'spec_helper'

feature "user posts a peep" do
  scenario "with a timestamp" do
    visit '/'
    post_peep("Yo I should have a timestamp")
    expect(Post.count).to eq(1)
    expect(Post.created_at.to_s).to include("DateTime")
    expect(page).to have_content(Time.now.strftime("%a %b %e %T %Y"))
  end

  def post_peep(body)
    fill_in "peep", :with => body
    click_button "overshare"
  end
end