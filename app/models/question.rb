class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  # Атрибут body не может иметь пустое значение.
  validates :body, presence: true
end
