require 'rails_helper'

RSpec.feature "Successful login redirects to home page", type: :feature, js: true do

  before :each do
    @user = User.create!(
      name: "Joe Bloe",
      email: "joe@bloe.ca",
      password: "password",
      password_confirmation: "password"
    )

  end

  scenario "User enters valid credentials and clicks submit" do
    # ACT
    visit login_path
    
    fill_in 'email', with: @user[:email]
    
    fill_in 'password', with: "password"
    
    click_on 'Submit'
    
    expect(page).to have_content 'Logout'
  end

end
