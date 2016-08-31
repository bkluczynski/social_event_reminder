require 'rails_helper'

feature 'User access' do
  scenario 'user can create an account' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "deadpool@marvel.com"
    fill_in 'Password', with: "whatever", :match => :prefer_exact
    fill_in 'Password confirmation', with: "whatever", :match => :prefer_exact
    click_button 'Sign up'
    expect(page.current_path).to eq '/'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end

  scenario 'user can sign in' do
    user = create(:user, email: 'email@email.com', password: "password1")

    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
