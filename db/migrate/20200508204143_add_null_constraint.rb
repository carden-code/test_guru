class AddNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :body, false)
    change_column_null(:tests, :title, :level, false)
    change_column_null(:questions, :body, false)
    change_column_null(:answers, :body, false)
    change_column_null(:users, :name, :age, false)
  end
end
