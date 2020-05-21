class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  # Обрабатывает исключение в случает когда вопрос не был найден.
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # Посмотреть все вопросы у конкретного теста.
  def index
    redirect_to @test
  end

  # Посмотреть конкретный вопрос у конкретного теста.
  def show
    render plain: @question.body
  end

  # Создаст новый вопрос (с тектом из формы) для конкретного теста
  def create
    @question = @test.questions.new(post_params)
    if @question.save
      redirect_to @test
    else
      render 'new'
    end
  end

  def new
    @question = Question.new
  end

  # Удаляет вопрос у конкретного теста.
  def destroy
    @test = @question.test
    @question.destroy
    redirect_to @test
  end

  private

  # Метод для before_action (Находит определённый тест по test_id)
  def find_test
    @test = Test.find(params[:test_id])
  end

  # Метод для before_action (Находит определённый вопрос по id)
  def find_question
    @question = Question.find(params[:id])
  end

  # Метод для rescue_from (Запускается при исключении)
  def rescue_with_question_not_found
    render plain: 'No such question'
  end

  # Передаёт параметры.
  def post_params
    params.require(:question).permit(:body)
  end
end
