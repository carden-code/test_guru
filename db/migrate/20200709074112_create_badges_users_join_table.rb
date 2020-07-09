class CreateBadgesUsersJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :badges, :users do |t|
      t.index %i[badge_id user_id]

      t.timestamps
    end
  end
end
