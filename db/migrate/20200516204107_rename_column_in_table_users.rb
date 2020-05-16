class RenameColumnInTableUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column(:users, :age, :email)
  end
end
