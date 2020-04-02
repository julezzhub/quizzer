class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.references :game, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
