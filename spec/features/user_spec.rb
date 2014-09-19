  require 'rails_helper'

feature 'User browsing the site' do
  context 'on sign up form' do
    before { visit signup_path }
    scenario 'sees the signup form' do
      expect(page).to have_selector(:button, "Sign Up")
    end

    scenario 'can fill in and submit form with valid info' do
      fill_in 'Name', with: 'User'
      fill_in 'Email', with: 'user@bad_example.com'
      fill_in 'Phone', with: '555-555-5555'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button "Sign Up"
      expect(page).to have_content("Welcome, User")
    end

    scenario 'cannot submit form with invalid email' do
      fill_in 'Email', with: 'user@@example.com'
      fill_in 'Phone', with: '555-555-5555'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button "Sign Up"
      expect(page).to have_content("Try again")
    end

    scenario 'cannot submit form with nonmatching password' do
      fill_in 'Email', with: 'user@bad_example.com'
      fill_in 'Phone', with: '555-555-5555'
      fill_in 'Password', with: 'password_raw'
      fill_in 'Password confirmation', with: 'password'
      click_button "Sign Up"
      expect(page).to have_content("Try again")
    end

    scenario 'cannot submit form with password that is too short' do
      fill_in 'Email', with: 'user@bad_example.com'
      fill_in 'Phone', with: '555-555-5555'
      fill_in 'Password', with: 'pass'
      fill_in 'Password confirmation', with: 'pass'
      click_button "Sign Up"
      expect(page).to have_content("Try again")
    end
  end

  context 'on edit page' do
    before do
      user = User.create(name: "User",
                  email: "user@bad_example.com",
                  phone: "555-555-5555",
                  password: "password",
                  password_confirmation: "password" )
      visit user_edit_path(user)
    end

    scenario 'fields are prefilled with user info' do
      expect(page).to have_selector("input[value='User']")
    end

    scenario 'fields can be updated with new values' do
      fill_in 'Name', with: 'Edited user'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Update'
      expect(page).to have_content("Welcome, Edited user")
    end

    scenario 'fields cannot be updated without password' do
      fill_in 'Name', with: 'Edited user'
      click_button 'Update'
      expect(page).to have_content("Try again")
    end
  end

end
