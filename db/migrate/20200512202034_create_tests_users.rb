class CreateTestsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :tests_users do |t|
      t.references :test, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
