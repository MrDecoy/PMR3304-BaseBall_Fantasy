Rails.application.routes.draw do

  #devise_for :users

  root 'pages#home'
  get '/players' => 'pages#players'
  get '/novo_jogo' => 'player_has_game#new_game'
  get '/add_players' => 'player_has_game#add_players'
  get '/show_games' => 'player_has_game#show'
  get '/edit_game' => 'player_has_game#edit_game'
  get '/view_games' => 'player_has_game#index'
  get '/post_edit' => 'player_has_game#edit_game_post'
  get '/admin' => 'pages#admin'
  get '/add_stadium' => 'stadia#new'
  get '/edit_stadium' => 'stadia#index'
  get '/edit_teams' => 'teams#index'
  get '/add_teams' => 'teams#new'

  devise_for :users
  #devise_for :sessions, controllers: {sessions: "users/sessions#new"}

  #resources :sessions
  resources :players
  resources :player_has_game
  resources :stadia
  resources :games
  resources :teams
  #resources :users


  match ':controller(/:action(/:id(.:format)))', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
