class Round < ApplicationRecord
  belongs_to :game
  belongs_to :question

  has_many :madeup_answers
end
