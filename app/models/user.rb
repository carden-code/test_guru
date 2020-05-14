class User < ApplicationRecord
  def list_all_tests(level)
    id = self.id

    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where('tests.level = ? AND tests_users.user_id = ?', level, id)
  end
end
