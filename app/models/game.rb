class Game < ApplicationRecord
  belongs_to :room

  has_many :rounds
  has_many :questions, through: :rounds
end
