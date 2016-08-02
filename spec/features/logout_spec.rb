require "rails_helper"

RSpec.feature "admin management", :type => :feature do
  background do
    User.create!(username: 'admin', email: 'admin@sfu.ca', password: 'adminadmin', password_confirmation: 'adminadmin', role: 'admin')
    visit new_user_session_path
    fill_in 'username', with: 'admin'
    fill_in 'password', with: 'adminadmin'
    click_button 'Log in'
  end

  scenario "see logout" do
    expect(page).to have_link('Logout')
  end

  scenario "click the link 'Logout'" do
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully')
  end
end
