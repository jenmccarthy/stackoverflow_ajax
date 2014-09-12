class QuestionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update]
end
