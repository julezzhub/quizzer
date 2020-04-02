class CreateMadeupAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :madeup_answers do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
