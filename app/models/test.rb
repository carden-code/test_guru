class Test < ApplicationRecord
  #has_and_belongs_to_many :categories
  def self.array_name_tests(category)
    categories.where(name: category).order(name: :desc)
  end
end
