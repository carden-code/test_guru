module TestsHelper
  TEST_LEVELS = { 0 || 1 => :Easy, 2 || 3 || 4 => :Medium }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || :Hard
  end
end
