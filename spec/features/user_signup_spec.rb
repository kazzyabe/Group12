require "rails_helper"

RSpec.feature "Welcome management", :type => :feature do
  scenario "With valid input" do
    visit new_user_registration_path
    fill_in 'username', with: 'test'
    fill_in 'email', with: 'test@sfu.ca'
    fill_in 'password', with: 'testtest'
    fill_in 'Confirm your password', with: 'testtest'
    click_button 'Sign up'

    expect(page).to have_text("Welcome to QMi, Test")
  end
end
