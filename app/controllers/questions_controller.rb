class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question

  # Обрабатывает исключение в случает когда вопрос не был найден.
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  private

  def show
  end

  # Метод для before_action (Находит определённый вопрос по id)
  def find_question
    @question = Question.find(params[:id])
  end

  # Метод для rescue_from (Запускается при исключении)
  def rescue_with_question_not_found
    render plain: 'No such question'
  end
end
