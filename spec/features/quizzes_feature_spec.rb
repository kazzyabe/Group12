require "rails_helper"

RSpec.feature "admin management", :type => :feature do
  background do
    User.create!(username: 'admin', email: 'admin@sfu.ca', password: 'adminadmin', password_confirmation: 'adminadmin', role: 'admin')
    visit new_user_session_path
    fill_in 'username', with: 'admin'
    fill_in 'password', with: 'adminadmin'
    click_button 'Log in'
    click_link 'Set up my Account'
    fill_in 'First Name', with: 'Admin'
    fill_in 'biography', with: 'test'
    within ".gender" do
      choose 'Male'
    end
    within ".interestedin" do
      choose 'Female'
    end
    select '20', from: "What's your age?"
    fill_in 'Current Password', with: 'adminadmin'
    click_button 'Update'
  end

  scenario "see Create/Edit Quiz" do
    expect(page).to have_button("Create/Edit Quiz")
  end
end
