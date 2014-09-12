require 'rails_helper'

describe "User sign in" do
  it "will successfully allow a user to sign in" do
    newuser = User.new(name: 'nacho libre', password: 'libre')
    visit '/signup'
    fill_in 'Name', with: 'nacho libre'
    fill_in 'Password', with: '12'
    fill_in 'Password confirmation', with: '12'
    click_button 'Create User'
    expect(page).to have_content 'Logged in as nacho'
  end

  it "will successfully show the log in page from the home page" do
    visit '/signup'
    click_link 'Log In'
    expect(page).to have_content 'Log In'
  end
end
