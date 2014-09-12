class QuestionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @questions = Question.all
  end


end
