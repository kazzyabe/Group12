require "rails_helper"

RSpec.feature "login management", :type => :feature do
  background do
    User.create!(username: 'test', email: 'test@sfu.ca', password: 'testtest', password_confirmation: 'testtest')
  end

  scenario "login successfully" do
    visit new_user_session_path
    fill_in 'username', with: 'test'
    fill_in 'password', with: 'testtest'
    click_button 'Log in'

    expect(page).to have_text("Welcome to QMi, Test")
  end

  scenario "wrong username" do
    visit new_user_session_path
    fill_in 'username', with: 'username'
    fill_in 'password', with: 'testtest'
    click_button 'Log in'

    expect(page).to have_text("Invalid Username or password")
  end

  scenario "wrong password" do
    visit new_user_session_path
    fill_in 'username', with: 'test'
    fill_in 'password', with: 'password'
    click_button 'Log in'

    expect(page).to have_text("Invalid Username or password")
  end
end
