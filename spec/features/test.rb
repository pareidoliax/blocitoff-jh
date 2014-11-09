require 'rails_helper'

feature 'Visitor sign in flow' do

  before do
    @user = create(:user)
  end

  scenario 'with valid email and password' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    expect( page ).to have_content('Signed in successfully')
  end
end