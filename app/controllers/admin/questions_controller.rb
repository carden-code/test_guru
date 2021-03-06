# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[update edit show destroy]

  # Обрабатывает исключение в случает когда вопрос не был найден.
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # Посмотреть конкретный вопрос у конкретного теста.
  def show
    @question.body
  end

  # Создаст новый вопрос (с тектом из формы) для конкретного теста
  def create
    @question = @test.questions.new(post_params)
    if @question.save
      redirect_to admin_question_path(@question), success: t('.success')
    else
      render :new
    end
  end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def update
    if @question.update(post_params)
      redirect_to admin_question_path(@question), success: t('.success')
    else
      render :edit
    end
  end

  # Удаляет вопрос у конкретного теста.
  def destroy
    @test = @question.test
    @question.destroy
    redirect_to admin_test_path(@test), warning: t('.success')
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
