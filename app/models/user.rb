class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users


  def list_all_tests(level)
    # id = self.id

    # Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
    #     .where('tests.level = ? AND tests_users.user_id = ?', level, id)
    tests.where(level: level)
  end
end
