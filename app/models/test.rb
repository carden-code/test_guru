class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users
  has_many :questions

  def self.array_name_tests(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.name = ?', category)
      .order(title: :desc).pluck(:title)
  end
end
