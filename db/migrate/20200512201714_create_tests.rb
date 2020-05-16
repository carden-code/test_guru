class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false, unique: true
      t.integer :level, default: 0, unique: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
