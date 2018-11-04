class Team < ApplicationRecord
  has_many :players, through: :round_participation
end
