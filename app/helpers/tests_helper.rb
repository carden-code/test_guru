# frozen_string_literal: true

module TestsHelper
  def test_level(test)
    test_level = { 0 || 1 => I18n.t('easy'), 2 || 3 || 4 => I18n.t('medium') }
    test_level[test.level] || I18n.t('hard')
  end
end
