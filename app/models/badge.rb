class Badge < ApplicationRecord
  RULES = %i[test_category attempts tests_level].freeze

  has_many :badges_users, dependent: :destroy
  has_many :users, through: :badges_users

  validates :name, :logo, :rule, :value, presence: true
end
