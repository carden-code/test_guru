class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  # Атрибут name не может иметь пустое значение.
  validates :name, presence: true

  # По умолчанию сортирует категории по имени(по возрастанию).
  default_scope { order(:name) }
end
