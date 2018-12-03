class Player < ApplicationRecord
  has_and_belongs_to_many :game
  belongs_to :team
  has_and_belongs_to_many :cartolas
  def unenrolled_cartolas
    Cartola.all - self.cartolas
  end

  def enrolled_in?(cartola)
    self.cartolas.include?(cartola)
  end

  def plays_in?(game)
    self.games.include?(game)
  end

  def not_playing_games
    Game.all - self.games
  end
end
