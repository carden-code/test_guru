require 'digest/sha1'

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  # Перед сохранением, email переводится в нижний регистр.
  before_save { self.email = email.downcase }

  # Атрибут name не могут иметь пустое значение
  validates :name, presence: true

  # Атрибут email не может иметь пустым значением и не может быть несколько одинаковых email.
  # Должен соответствовать формату VALID_EMAIL_REGEX
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # Валидации наличия и подтверждения password автоматически добавляются.
  has_secure_password

  # Минимальная длина passwjrd 6 символов.
  validates :password, length: { minimum: 6 }

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
