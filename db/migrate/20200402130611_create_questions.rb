class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :deck, foreign_key: true
      t.text :content
      t.text :solution

      t.timestamps
    end
  end
end
