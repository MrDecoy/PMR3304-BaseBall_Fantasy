class Cartola < ApplicationRecord
  belongs_to :user
  has_many :cartola_players
  has_many :players, through: :cartola_players


end
