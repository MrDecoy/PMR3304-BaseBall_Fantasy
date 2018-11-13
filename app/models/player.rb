class Player < ApplicationRecord
  has_and_belongs_to_many :game
  belongs_to :team

  def enrolled_in?(team)
    #Check if player is included in any team
    self.teams.include?(team)
  end
end
