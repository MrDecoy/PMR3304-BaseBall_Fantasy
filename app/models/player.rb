class Player < ApplicationRecord
  has_and_belongs_to_many :game
  has_one :team
  has_and_belongs_to_many :cartolas

  def unenrolled_cartolas
    Cartola.all - self.cartolas
  end

  def enrolled_in?(cartola)
    self.cartolas.include?(cartola)
  end
end
