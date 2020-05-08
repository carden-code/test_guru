class ChangeTestsColumnLevelDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, 0)
  end
end
