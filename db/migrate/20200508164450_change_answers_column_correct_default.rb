class ChangeAnswersColumnCorrectDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, 'no answer')
  end
end
