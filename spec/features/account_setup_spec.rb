require "rails_helper"

RSpec.feature "admin management", :type => :feature do
  background do
    User.create!(username: 'admin', email: 'admin@sfu.ca', password: 'adminadmin', password_confirmation: 'adminadmin', role: 'admin')
    visit new_user_session_path
    fill_in 'username', with: 'admin'
    fill_in 'password', with: 'adminadmin'
    click_button 'Log in'
  end

  scenario "see Set up my account" do
    expect(page).to have_link("Set up my Account")
  end

  scenario "go to account set up page" do
    click_link 'Set up my Account'
    expect(page).to have_text("Account Information")
  end

  scenario "set up the account info" do
    click_link 'Set up my Account'
    fill_in 'First name', with: 'Admin'
    fill_in 'Write something about yourself that will interest others!', with: "test"
  end
end
