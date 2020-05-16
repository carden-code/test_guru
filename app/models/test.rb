class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  # title и level не может быть пустой строкой и
  # не может иметь одинаковые названия.
  validates_uniqueness_of :title, scope: :level

  # Проверка валидности атрибута level на то,
  # что level может быть только целым положительным числом.
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Проверка валидности level на максимальное значение при создании объекта.
  validate :validate_max_level, on: :create

  # Возвращает отсортированный по убыванию массив названий всех Тестов у которых
  # Категория называется определённым образом.
  scope :array_name_tests, ->(name) { joins(:category).where(categories: { name: name }).order(title: :desc).pluck(:title) }

  # Выбор тестов по уровню сложности:
  # easy - простой (нулевой или первый уровень),
  scope :easy, -> { where(level: (0..1)) }

  # medium - средний (со второго по четвёртый),
  scope :medium, -> { where(level: (2..4)) }

  # difficult - сложный (с пятого и выше).
  scope :difficult, -> { where(level: (5..)) }

  private

  def validate_max_level
    errors.add(:level) if level.to_i > 10
  end
end
