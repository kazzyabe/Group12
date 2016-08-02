require "rails_helper"

RSpec.feature "admin management", :type => :feature do
  background do
    User.create!(username: 'admin', email: 'admin@sfu.ca', password: 'adminadmin', password_confirmation: 'adminadmin', role: 'admin')
    visit new_user_session_path
    fill_in 'username', with: 'admin'
    fill_in 'password', with: 'adminadmin'
    click_button 'Log in'
  end

  scenario "login successfully" do
    expect(page).to have_link("admin")
  end

  scenario "go to admin page" do
    click_link 'admin'
    expect(page).to have_text("Site Administration")
  end
end
