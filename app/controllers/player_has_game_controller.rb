class PlayerHasGameController < ApplicationController
  def new_game
    @team_1 = Team.all
    @team_2 = Team.all
    @stadium = Stadium.all
  end

  def index
    @player_has_game = PlayerHasGame.all
    @game = Game.all
    games_sql = "select g.id, t1.Name as home_team, t2.Name as visiting_team, coalesce(sum(case when phg.team_id = home_team then runs else null end),0) as home_score, coalesce(sum(case when phg.team_id = visiting_team then runs else null end),0) as visiting_score from games g inner join player_has_games phg on phg.game_id = g.id inner join teams t1 on t1.id = g.home_team inner join teams t2 on t2.id = g.visiting_team group by 1,2,3"
    @games = ActiveRecord::Base.connection.execute(games_sql)

  end

  def edit_game_post
    @player_has_game = params

    @player_has_game.keys[2, 16].each do |player_id|
      @player = PlayerHasGame.where("player_id = ? and game_id = ?", player_id, params[:game_id])
      @player[0].home_run = params[player_id][:home_run]
      @player[0].hits = params[player_id][:hits]
      @player[0].at_bats = params[player_id][:at_bats]
      @player[0].rbi = params[player_id][:rbi]
      @player[0].runs = params[player_id][:runs]
      print(@player[0].runs)
      @player[0].save
    end
    redirect_to root_path
  end

  def edit_game
    @game = params
    @game_id = params[:game_id]
    @player_has_game = PlayerHasGame.find_by_sql(["select * from player_has_games where game_id = ?", params[:game_id]])
    @teams = PlayerHasGame.find_by_sql(["select distinct team_id from player_has_games where game_id = ?", params[:game_id]])
    @player = Player.all

    @pitcher_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'P', @teams[0][:team_id], params[:game_id]])
    @pitcher_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'P', @teams[1][:team_id], params[:game_id]])
    @first_base_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", '1B', @teams[0][:team_id], params[:game_id]])
    @first_base_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", '1B', @teams[1][:team_id], params[:game_id]])

    @second_base_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", '2B', @teams[0][:team_id], params[:game_id]])
    @second_base_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", '2B', @teams[1][:team_id], params[:game_id]])

    @third_base_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", '3B', @teams[0][:team_id], params[:game_id]])
    @third_base_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", '3B', @teams[1][:team_id], params[:game_id]])

    @shortstop_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'SS', @teams[0][:team_id], params[:game_id]])
    @shortstop_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'SS', @teams[1][:team_id], params[:game_id]])

    @right_field_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'RF', @teams[0][:team_id], params[:game_id]])
    @right_field_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'RF', @teams[1][:team_id], params[:game_id]])

    @center_field_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'CF', @teams[0][:team_id], params[:game_id]])
    @center_field_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'CF', @teams[1][:team_id], params[:game_id]])

    @left_field_1 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'LF', @teams[0][:team_id], params[:game_id]])
    @left_field_2 = PlayerHasGame.find_by_sql(["select * from player_has_games pg left join players p on p.id = pg.player_id where p.Position = ? and pg.team_id = ? and pg.game_id = ?", 'LF', @teams[1][:team_id], params[:game_id]])

  end

  def add_players
    print(params["date"][:year])
    @player1 = Player.where(team_id: params[:team_1]) if params[:team_1].present?
    @player2 = Player.where(team_id: params[:team_2]) if params[:team_2].present?
    @game = Game.new("stadium_id" => params[:stadium_id], "home_team" => params[:team_1], "visiting_team" => params[:team_2], "game_date" => DateTime.new(Integer(params["date"][:year]), Integer(params["date"][:month]), Integer(params["date"][:day]), Integer(params["date"][:hour]), Integer(params["date"][:minute]))) if params[:stadium_id].present?

    @game.save if @game
    @home_team = Team.where(id: params[:team_1]) if params[:team_1].present?
    visiting_team = Team.where(id: params[:team_2]) if params[:team_2].present?

    @player11 = Player.where(team_id: params[:team_1], :position => "SS") if params[:team_1].present?
    @player12 = Player.where(team_id: params[:team_1], :position => "1B") if params[:team_1].present?
    @player13 = Player.where(team_id: params[:team_1], :position => "2B") if params[:team_1].present?
    @player14 = Player.where(team_id: params[:team_1], :position => "3B") if params[:team_1].present?
    @player15 = Player.where(team_id: params[:team_1], :position => "P") if params[:team_1].present?
    @player16 = Player.where(team_id: params[:team_1], :position => "RF") if params[:team_1].present?
    @player17 = Player.where(team_id: params[:team_1], :position => "CF") if params[:team_1].present?
    @player18 = Player.where(team_id: params[:team_1], :position => "LF") if params[:team_1].present?

    @player21 = Player.where(team_id: params[:team_2], :position => "SS") if params[:team_2].present?
    @player22 = Player.where(team_id: params[:team_2], :position => "1B") if params[:team_2].present?
    @player23 = Player.where(team_id: params[:team_2], :position => "2B") if params[:team_2].present?
    @player24 = Player.where(team_id: params[:team_2], :position => "3B") if params[:team_2].present?
    @player25 = Player.where(team_id: params[:team_2], :position => "P") if params[:team_2].present?
    @player26 = Player.where(team_id: params[:team_2], :position => "RF") if params[:team_2].present?
    @player27 = Player.where(team_id: params[:team_2], :position => "CF") if params[:team_2].present?
    @player28 = Player.where(team_id: params[:team_2], :position => "LF") if params[:team_2].present?


  end


  def show
    @game = Game.all[-1]
    @player = Player.all
    @player11 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player11_id], "team_id" => Player.find(params[:player11_id]).team_id)
    @player12 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player12_id], "team_id" => Player.find(params[:player12_id]).team_id)
    @player13 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player13_id], "team_id" => Player.find(params[:player13_id]).team_id)
    @player14 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player14_id], "team_id" => Player.find(params[:player14_id]).team_id)
    @player15 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player15_id], "team_id" => Player.find(params[:player15_id]).team_id)
    @player16 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player16_id], "team_id" => Player.find(params[:player16_id]).team_id)
    @player17 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player17_id], "team_id" => Player.find(params[:player17_id]).team_id)
    @player18 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player18_id], "team_id" => Player.find(params[:player18_id]).team_id)

    @player21 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player21_id], "team_id" => Player.find(params[:player21_id]).team_id)
    @player22 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player22_id], "team_id" => Player.find(params[:player22_id]).team_id)
    @player23 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player23_id], "team_id" => Player.find(params[:player23_id]).team_id)
    @player24 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player24_id], "team_id" => Player.find(params[:player24_id]).team_id)
    @player25 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player25_id], "team_id" => Player.find(params[:player25_id]).team_id)
    @player26 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player26_id], "team_id" => Player.find(params[:player26_id]).team_id)
    @player27 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player27_id], "team_id" => Player.find(params[:player27_id]).team_id)
    @player28 = PlayerHasGame.new("game_id" => @game.id, "player_id" => params[:player28_id], "team_id" => Player.find(params[:player28_id]).team_id)

    @player11.save if params[:player11_id].present?
    @player12.save if params[:player12_id].present?
    @player13.save if params[:player13_id].present?
    @player14.save if params[:player14_id].present?
    @player15.save if params[:player15_id].present?
    @player16.save if params[:player16_id].present?
    @player17.save if params[:player17_id].present?
    @player18.save if params[:player18_id].present?
    @player21.save if params[:player21_id].present?
    @player22.save if params[:player22_id].present?
    @player23.save if params[:player23_id].present?
    @player24.save if params[:player24_id].present?
    @player25.save if params[:player25_id].present?
    @player26.save if params[:player26_id].present?
    @player27.save if params[:player27_id].present?
    @player28.save if params[:player28_id].present?
  end
  def create
    @player_has_game = PlayerHasGame.new(player_has_game_params)

    respond_to do |format|
      if @player_has_game.save
        format.html {redirect_to @player_has_game, notice: 'Game was successfully created.'}
        format.json {render :show, status: :created, location: @player_has_game}
      else
        format.html {render :new}
        format.json {render json: @player_has_game.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html {redirect_to @player, notice: 'Player was successfully updated.'}
        format.json {render :show, status: :ok, location: @player}
      else
        format.html {render :edit}
        format.json {render json: @player.errors, status: :unprocessable_entity}
      end
    end
  end

  def player
    @player = @player_has_game.players
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def player_has_game_params
    params.require(:player_has_game).permit(:game_id, :player_id, :team_id, :score, :home_run, :hits, :at_bats, :rbi, :runs, :misses)
  end
end


