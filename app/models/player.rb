class Player < ApplicationRecord
  has_many :cartola_players
  has_many :cartolas, through: :cartola_players


end
