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

  scenario "see Create Quiz" do
    expect(page).to have_button("Create Quiz")
  end

  scenario "click create quiz" do
    click_button 'Create Quiz'
    expect(page).to have_text("Your Current Quiz")
  end

  scenario "create a quiz" do
    click_button 'Create Quiz'
    fill_in 'Question 1', with: 'q1?'
    fill_in 'Question 2', with: 'q2?'
    fill_in 'Question 3', with: 'q3?'
    fill_in 'Question 4', with: 'q4?'
    fill_in 'Question 5', with: 'q5?'
    click_button 'Create'
    expect(page).to have_button("Edit Quiz")
    click_button 'Edit Quiz'
    expect(page).to have_field 'Question 1', with: 'q1?'
  end
end
