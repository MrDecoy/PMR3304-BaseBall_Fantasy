Rails.application.routes.draw do
  resources :players_has_jogos
  resources :players
  resources :cartolas
  resources :stadia
  resources :games
  resources :teams
  root 'pages#home'
  get '/players' => 'pages#players'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
