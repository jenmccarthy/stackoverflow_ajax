class AnswersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

end
