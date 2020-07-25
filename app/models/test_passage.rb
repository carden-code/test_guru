# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PERCENT = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  # Обратный вызов для определения текущего вопроса
  before_validation :before_validation_set_first_question, on: :create

  # Обратный вызов для определения следующего вопроса.
  before_validation :before_validation_set_next_question, on: :update

  validate :validate_timer, on: :update, if: :timer?

  # Метод complited? проверяет пройден ли тест.
  def complited?
    current_question.nil?
  end

  # Метод accept! увеличивает атрибут correct_questions на 1 в случе если ответ
  # на вопрос правильный.
  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  # Метод passing_result? проверяет успешно ли пройден тест.
  # Если процент успеха >= 85% - true. Если процент успеха < 85% - false.
  def passing_result?
    self.correct_questions >= self.test.questions.size * PERCENT
  end

  # Возвращает номер текущего вопроса.
  def current_question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def timer?
    test.duration.positive?
  end

  def timer_in_seconds
    test.duration * 60
  end

  def duration_in_seconds
    Time.zone.now - created_at
  end

  def seconds_left
    timer_in_seconds - duration_in_seconds
  end

  private

  def validate_timer
    errors.add(:duration, I18n.t('timer')) if seconds_left.negative?
  end

  # Метод обратного вызова для определения текущего вопроса.
  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  # Метод обратного вызова для определения следующего вопроса.
  def before_validation_set_next_question
    self.current_question = next_question
  end

  # Метод correct_answer? определяет сравнивает правильный ответ с ответом
  # пользователя который пиходит в параметре (answer_ids) в виде массива.
  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  # Метод next_question возвращает следующий вопрос.
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  # Метод correct_answers вернёт правильные ответы на текущий вопрос.
  # С помощью scope метода(right_answer) определённого в моделе Answer.
  def correct_answers
    current_question.answers.right_answer
  end
end
