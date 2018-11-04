class Game < ApplicationRecord
  has_many :teams
  has_one :stadium
end
