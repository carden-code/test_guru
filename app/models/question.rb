class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  # Атрибут body не может иметь пустое значение.
  validates :body, presence: true
end
