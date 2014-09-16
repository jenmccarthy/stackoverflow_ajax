class QuestionsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Successful"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def update

    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to user_questions_path(current_user)
      flash[:notice] = "#{@question.description} Updated Successfully"

    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Successful"
    redirect_to user_path(current_user)
  end

  private
  def question_params
    params.require(:question).permit(:description, :user_id, :favorite_answer_id)
  end

end
