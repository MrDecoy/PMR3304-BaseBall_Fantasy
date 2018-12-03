class PagesController < ApplicationController
  #TODO: Fix teams structure to make sure we can edit the player in teams. Also need to understand how we will edit each team.
  def home
    @players = Player.all
    players_sql = "select p.Name, t.name as team, p.position, sum(runs) as runs, sum(home_run) as home_run from players p left join player_has_games phg on phg.player_id = p.id left join teams t on t.id = p.team_id group by 1,2,3 order by sum(runs) desc limit 10"
    @players = ActiveRecord::Base.connection.execute(players_sql)

    games_sql = "select s.university as stadium
                       , g.game_date
                       , t1.Name as home_team
                       , t2.Name as visiting_team
                       , coalesce(sum(case when phg.team_id = home_team then runs else null end),0) as home_score
                       , coalesce(sum(case when phg.team_id = visiting_team then runs else null end),0) as visiting_score
                from games g
                inner join player_has_games phg on phg.game_id = g.id
                left join teams t1 on t1.id = g.home_team
                left join teams t2 on t2.id = g.visiting_team
                inner join stadia s on s.id = g.stadium_id
              group by 1,2,3"
    @games = ActiveRecord::Base.connection.execute(games_sql)

  end

  def players
    @players = Player.all
    players_sql = "select p.Name, t.name as team, p.position, sum(runs) as runs, sum(home_run) as home_run from players p left join player_has_games phg on phg.player_id = p.id left join teams t on t.id = p.team_id group by 1,2,3 order by sum(runs) desc limit 10"
    @players = ActiveRecord::Base.connection.execute(players_sql)
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
