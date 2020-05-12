class Test < ApplicationRecord
  has_many :questions
  def self.array_name_tests(category)
    #categories.where(name: category).order(name: :desc)
  end
end
