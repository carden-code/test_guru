# frozen_string_literal: true

class Admin::AnswersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_answer_path(@answer), success: t('.success')
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), success: t('.success')
    else
      render :edit
    end
  end

  def destroy
    question = @answer.question
    @answer.destroy
    redirect_to admin_question_path(question), warning: t('.success')
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
