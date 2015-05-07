require 'spec_helper'
require 'rails_helper'

feature 'User Signs Up' do
  before do
    sign_up_with 'John Smith', '12345', 'valid@example.com', 'password', 'password'
  end
  scenario 'with valid name, zipcode, email, password and password_confirmation' do

    visit new_category_path

    fill_in 'Name', with: 'Example Category'
    click_button 'Create Category'

    expect(page).to have_content('Example Category')
  end

  def sign_up_with(name, zipcode, email, password, password_confirmation)
    visit new_user_registration_path
    fill_in 'Name', with: name
    fill_in 'Zipcode', with: zipcode
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Sign up'
  end
end