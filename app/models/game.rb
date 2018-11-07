class Game < ApplicationRecord
  belongs_to :stadium
  has_many :teams, through: :players_has_jogos
  belongs_to :players_has_jogo
end