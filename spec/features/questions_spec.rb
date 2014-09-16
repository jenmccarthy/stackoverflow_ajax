require 'rails_helper'

describe "questions all page" do
  it "takes any user to individual question show page when clicking the link" do
    user = User.create(name: 'nacho libre', password: 'libre', password_confirmation: 'libre')
    answer = Answer.create(description: 'short and sweet')
    q1 = Question.create(description: 'what is a computer', user_id: user.id, favorite_answer_id: answer.id)
    q2 = Question.create(description: 'where is the monitor', user_id: user.id, favorite_answer_id: answer.id)
    visit '/questions'
    click_link 'what is a computer'
    expect(page).to have_content 'All Answers:'
  end

  it 'will take input that correctly searches all questions' do
    user = User.create(name: 'nacho libre', password: 'libre', password_confirmation: 'libre')
    answer = Answer.create(description: 'short and sweet')
    q1 = Question.create(description: 'what is a computer', user_id: user.id, favorite_answer_id: answer.id)
    q2 = Question.create(description: 'where is the monitor', user_id: user.id, favorite_answer_id: answer.id)
    visit "/questions"
    find_field('search')
    fill_in 'search', with: 'computer'
    click_button 'search'
    expect(page).to have_content 'what is a computer'
  end

end
