require 'rails_helper'

describe "User sign in" do
  it "will successfully allow a user to sign up" do
    newuser = User.new(name: 'nacho libre', password: 'libre')
    visit '/signup'
    fill_in 'Name', with: 'nacho libre'
    fill_in 'Password', with: '12'
    fill_in 'Password confirmation', with: '12'
    click_button 'Create User'
    expect(page).to have_content 'Logged in as nacho'
  end

  it "will not allow a user to sign up without correct information" do
    newuser = User.new(name: 'nacho libre', password: 'libre')
    visit '/signup'
    fill_in 'Name', with: 'nacho libre'
    fill_in 'Password', with: '12'
    fill_in 'Password confirmation', with: '13'
    click_button 'Create User'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end


  it "will successfully show the log in page from the home page" do
    visit '/signup'
    click_link 'Log In'
    expect(page).to have_content 'Log In'
  end

  it "will successfully allow a registered user to log in" do
    user = User.create(name: 'nacho libre', password: 'libre')
    visit '/login'
    fill_in 'Name', with: 'nacho libre'
    fill_in 'Password', with: 'libre'
    click_button 'Log In'
    expect(page).to have_content 'Logged in as nacho libre'
  end


  it "will not allow a registered user to log in with incorrect information" do
    user = User.create(name: 'nacho libre', password: 'libre')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'nacho'
    click_button 'Log In'
    expect(page).to have_content 'email or password is invalid'
  end

  it "successfully log a user out" do
    user = User.create(name: 'nacho libre', password: 'libre')
    visit '/login'
    fill_in 'Name', with: 'nacho libre'
    fill_in 'Password', with: 'libre'
    click_button 'Log In'
    click_link 'Log Out'
    expect(page).to have_content 'logged out'
  end

end
