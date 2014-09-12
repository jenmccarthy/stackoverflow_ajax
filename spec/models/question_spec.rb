require 'rails_helper'

describe Question do

  it { should belong_to :user }

  it { should have_many :answers }

  it { should validate_presence_of :description}
end
