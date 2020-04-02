class Room < ApplicationRecord
  has_many :users
  has_many :games

  validates_presence_of :name
  validates_uniqueness_of :name
  validates :capacity, presence: true, unless: :lobby

  def lobby
    name == "Lobby"
  end

end
