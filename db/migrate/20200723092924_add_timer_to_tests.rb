class AddTimerToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :duration, :integer, default: 0
  end
end
