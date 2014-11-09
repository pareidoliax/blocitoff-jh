require 'rails_helper'

feature 'Visitor sign in flow' do

  # before do
  #   @user = create(:user)
  #   @user2 = create(:user)
  #   @user3 = create(:user)
  # end

  scenario 'with valid email and password' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect( page ).to have_content('Signed in successfully')
  end

  # scenario 'with invalid email' do
  #   visit new_user_session_path
  #   fill_in 'Email', with: 'papa@invalid.com'
  #   fill_in 'Password', with: @user2.password
  #   click_button 'Log in'
  #   find_link('Sign In').visible?
  # end

  # scenario 'with blank password' do
  #   visit new_user_session_path
  #   fill_in 'Email', with: @user3.email
  #   click_button 'Log in'
  #   find_link('Sign In').visible?
  # end
  
end
