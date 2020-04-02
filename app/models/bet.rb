class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :round
  belongs_to :madeup_answer
end
