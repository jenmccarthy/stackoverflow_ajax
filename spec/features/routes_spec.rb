require 'rails_helper'

describe 'page visitor viewing all questions' do
  it 'will redirect page to view all questions when image is clicked' do
    visit'/'
    find(:xpath, "//a/img[@alt='Question']/..").click
    expect(page).to have_content "Click on a question"
  end
end

describe 'logged in viewers can view their show page from the nav bar link' do
  it 'will redirect a logged in user to his/her show page' do
    user = User.create(name: 'nacho libre', password: 'libre')
    visit '/login'
    fill_in 'Name', with: 'nacho libre'
    fill_in 'Password', with: 'libre'
    click_button 'Log In'
    click_link 'nacho libre'
    expect(page).to have_content "Questions written by nacho libre"
  end
end
