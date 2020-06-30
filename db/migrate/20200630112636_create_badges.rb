class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.text :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
