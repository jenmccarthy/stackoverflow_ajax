class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  has_many :votes
  validates :description, presence: true
end
