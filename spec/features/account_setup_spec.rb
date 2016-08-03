require "rails_helper"

RSpec.feature "account set up management", :type => :feature do
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
    expect(page).to have_text("A little bit about you: test")
    expect(page).to have_text("Your Gender: Male")
    expect(page).to have_text("Gender You're Interested In: Female")
    expect(page).to have_text("Your Age: 20")
  end
end
