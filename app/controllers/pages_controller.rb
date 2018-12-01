class PagesController < ApplicationController
  #TODO: Fix teams structure to make sure we can edit the player in teams. Also need to understand how we will edit each team.
  def home
    @players = Player.all
  end

  def players
  @users = User.all
  end

  def player_game
    @player_game = PlayerHasGames.new
    @teams = Team.all
    @players_1b = Player.find_by_sql("select * from players where Position = 1B")
    @players_2b = Player.find_by_sql("select * from players where Position = 2B")
    @players_3b = Player.find_by_sql("select * from players where Position = 3B")
    @players_short_stop = Player.find_by_sql("select * from players where Position = SS")
    @players_pitcher = Player.find_by_sql("select * from players where Position = P")
    @players_right_field = Player.find_by_sql("select * from players where Position = RF")
    @players_center_field = Player.find_by_sql("select * from players where Position = CF")
    @players_left_field = Player.find_by_sql("select * from players where Position = CF")

  end
end
