class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  # Атрибуты name и email не могут иметь пустое значение.
  validates :name, :email, presence: true

  # Метод list_all_tests принимает в качестве аргумента значение
  # уровня сложности и возвращает список всех Тестов, которые проходит или
  # когда-либо проходил Пользователь на этом уровне сложности
  def list_all_tests(level)
    tests.where(level: level)
  end
end
