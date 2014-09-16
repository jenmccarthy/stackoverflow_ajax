require 'rails_helper'

describe Question do

  it { should belong_to :user }

  it { should have_many :answers }

  it { should validate_presence_of :description}

  it 'will allow search on the Question model' do
    question = Question.create(description: 'what is a computer', user_id: 1)
    question2 = Question.create(description: 'where is the monitor', user_id: 2)
    expect(Question.search('computer')).to eq [question]
  end
end
