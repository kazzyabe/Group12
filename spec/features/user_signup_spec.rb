require "rails_helper"

RSpec.feature "signup management", :type => :feature do
  scenario "With valid input" do
    visit new_user_registration_path
    fill_in 'username', with: 'test'
    fill_in 'email', with: 'test@sfu.ca'
    fill_in 'password', with: 'testtest'
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'

    expect(page).to have_text("Welcome to QMi, Test")
  end

  scenario "With invalid input" do
    visit new_user_registration_path
    fill_in 'username', with: ''
    fill_in 'email', with: ''
    fill_in 'password', with: ''
    fill_in 'Confirm your password', with: ''
    click_button 'Sign up'

    expect(page).to have_text("errors")
  end

  scenario "With invalid input:missing username" do
    visit new_user_registration_path
    fill_in 'username', with: ''
    fill_in 'email', with: 'test@sfu.ca'
    fill_in 'password', with: 'testtest'
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'

    expect(page).to have_text("Username can't be blank")
  end

  scenario "With invalid input:missing email" do
    visit new_user_registration_path
    fill_in 'username', with: 'test'
    fill_in 'email', with: ''
    fill_in 'password', with: 'testtest'
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'

    expect(page).to have_text("Email can't be blank")
  end

  scenario "With invalid input:missing password" do
    visit new_user_registration_path
    fill_in 'username', with: 'test'
    fill_in 'email', with: 'test@sfu.ca'
    fill_in 'password', with: ''
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'

    expect(page).to have_text("Password can't be blank")
  end

  scenario "With invalid input:username or email already taken" do
    visit new_user_registration_path
    fill_in 'username', with: 'test'
    fill_in 'email', with: 'test@sfu.ca'
    fill_in 'password', with: 'testtest'
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'
    click_link 'Logout'
    visit new_user_registration_path
    fill_in 'username', with: 'test'
    fill_in 'email', with: 'test@sfu.ca'
    fill_in 'password', with: 'testtest'
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'

    expect(page).to have_text("Username has already been takenEmail has already been taken")
  end
end
