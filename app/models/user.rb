class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  # Атрибуты name и email не могут иметь пустое значение.
  validates :name, :email, presence: true

  # Метод list_all_tests принимает в качестве аргумента значение
  # уровня сложности и возвращает список всех Тестов, которые проходит или
  # когда-либо проходил Пользователь на этом уровне сложности
  def list_all_tests(level)
    tests.where(level: level)
  end

  # Метод test_passage принимает в виде параметра объект теста и возращает
  # последний тест из таблицы test_passages соответствущий его id.
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
