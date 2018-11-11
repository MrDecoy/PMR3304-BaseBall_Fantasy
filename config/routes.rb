Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :players_has_jogos
  resources :players
  resources :cartolas
  resources :stadia
  resources :games
  resources :teams
  resources :users

  root 'pages#home'
  get '/players' => 'pages#players'
  get '/sign_in' => 'users#sign_in'
  match ':controller(/:action(/:id(.:format)))', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
