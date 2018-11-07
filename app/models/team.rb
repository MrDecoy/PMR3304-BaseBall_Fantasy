class Team < ApplicationRecord
  has_many :players, through: :players_has_jogos
  belongs_to :players_has_jogo
end
