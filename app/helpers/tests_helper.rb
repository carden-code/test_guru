# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 || 1 => I18n.t('easy'), 2 || 3 || 4 => I18n.t('medium') }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('hard')
  end
end
