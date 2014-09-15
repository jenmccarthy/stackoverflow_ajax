class AnswersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      respond_to do |format|
      format.html { redirect_to question_url(@question), notice: 'success' }
      format.js
      end
    end
  end

  def update

    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to user_questions_path
      flash[:notice] = "#{@answer} Updated Successfully"

    end
  end

private

  def answer_params
    params.require(:answer).permit(:description, :user_id, :question_id, :top_of_list)
  end

end
