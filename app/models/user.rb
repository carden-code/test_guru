class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users


  def list_all_tests(level)
    tests.where(level: level)
  end
end
