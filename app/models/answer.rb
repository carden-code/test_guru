class Answer < ApplicationRecord
  belongs_to :question

  # Атрибут body не может иметь пустое значение.
  validates :body, presence: true

  # Проверка колличества ответов при создании.
  validate :max_answers, on: :create

  # Возвращет правильный ответ.
  scope :right_answer, -> { where correct: true }

  private

  # Добавляет в errors question текст ошибки если попытаться создать больше 4 ответов.
  def max_answers
    errors.add(question, 'Answers can be no more than 4') if question.answers.count >= 4
  end
end
