require "rails_helper"

RSpec.feature "Welcome management", :type => :feature do
  scenario "User visit the landing page for the first time" do
    visit "/"

    expect(page).to have_text("You came to the right place")
  end

  scenario "User click the 'Sign me up!' link" do
    visit "/"
    click_link "Sign me up!"

    expect(page).to have_text("You've made the right choice")
  end

  scenario "User click the 'Already have an account?' link" do
    visit "/"
    click_link "Already have an account?"

    expect(page).to have_text("We're as ready as you are")
  end
end
