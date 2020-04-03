class Game < ApplicationRecord
  belongs_to :room

  has_many :rounds, dependent: :destroy
  has_many :questions, through: :rounds
end
