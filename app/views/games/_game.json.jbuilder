json.extract! game, :id, :home_id, :visitor_id, :stadium_id, :round_id, :home_score, :visiting_score, :created_at, :updated_at
json.url game_url(game, format: :json)
