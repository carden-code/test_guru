class ChangeColumnEmailInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string
  end
end
