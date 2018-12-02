class PlayerHasGameController < ApplicationController
  def new_game
    @team_1 = Team.all
    @team_2 = Team.all
    @player = Player.where(team_id: params[:team_id]) if params[:team_id].present?

    @player_has_game = PlayerHasGame.new
    @game = Game.new
    @stadium = Stadium.all

  end

  def create
    @player_has_game = PlayerHasGame.new(player_has_game_params)

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_has_game_params
    params.require(:game).permit(:game_id, :player_id, :team_id, :score, :home_run, :hits, :at_bats, :rbi, :runs, :misses)
  end
end

