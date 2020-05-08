class AddUsersBodyNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :name, :age, false)
  end
end
