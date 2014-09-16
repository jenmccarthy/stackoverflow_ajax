require 'rails_helper'

describe 'page visitor viewing all questions' do
  it 'will redirect page to view all questions when image is clicked' do
    visit'/'
    find(:xpath, "//a/img[@alt='Question']/..").click
    expect(page).to have_content "Click on a question"
  end

end
