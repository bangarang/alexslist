require 'spec_helper'
require 'rails_helper'

feature 'User Signs Up and Creates Category' do
  scenario 'with valid name, zipcode, email and password' do
    sign_up_with 'John Smith', '12345', 'valid@example.com', 'password'

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_up_with 'John Smith', '12345', 'invalid email', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'John Smith', '12345','valid@example.com', ''

    expect(page).to have_content('Sign up')
  end

  def sign_up_with(name, zipcode, email, password)
    visit new_user_registration_path
    fill_in 'Name', with: name
    fill_in 'Zipcode', with: zipcode
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'
  end
end