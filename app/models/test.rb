class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :users, through: :test_passages

  # title и level не может быть пустой строкой и
  # не может иметь одинаковые названия.
  validates :title, presence: true, uniqueness: { scope: :level }

  # Проверка валидности атрибута level на то,
  # что level может быть только целым положительным числом меньше 10.
  validates :level, :duration, numericality: { only_integer: true,
                                               greater_than_or_equal_to: 0,
                                               less_than_or_equal_to: 10 }

  # Возвращает отсортированный по убыванию массив названий всех Тестов у которых
  # Категория называется определённым образом.
  def self.array_name_tests(name)
    joins_category(name).order(title: :desc).pluck(:title)
  end

  # Присоединяет таблицу categories
  scope :joins_category, ->(name) { joins(:category).where(categories: { name: name }) }

  # Выбор тестов по уровню сложности:
  # easy - простой (нулевой или первый уровень),
  scope :easy, -> { where(level: (0..1)) }

  # medium - средний (со второго по четвёртый),
  scope :medium, -> { where(level: (2..4)) }

  # difficult - сложный (с пятого и выше).
  scope :hard, -> { where(level: (5..)) }

  def timer?
    duration.positive?
  end
end
