class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :round, foreign_key: true
      t.references :madeup_answer, foreign_key: true

      t.timestamps
    end
  end
end
