class PagesController < ApplicationController
  #TODO: Fix teams structure to make sure we can edit the player in teams. Also need to understand how we will edit each team.
  def home
    @players = Player.all
  end

  def players
  @users = User.all
  end
end
