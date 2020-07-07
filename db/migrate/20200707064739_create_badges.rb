class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.text :img
      t.references :user

      t.timestamps
    end
  end
end
