Rails.application.routes.draw do

  resources :students do
    resources :awards
    member do
      get :courses
      post :course_add
      post :course_remove
    end
  end
  devise_for :users, controllers: {users: "users/registration#new"}

  resources :cartolas do
    member do
      get :players_in_cartola
    end
  end
  resources :players do
    member do
      get :cartolas
      post :cartola_add
      post :cartola_remove
    end
  end
  resources :sessions
  resources :players_has_jogos
  resources :players
  resources :cartolas
  resources :stadia
  resources :games
  resources :teams
  #resources :users

  root 'pages#home'
  get '/players' => 'pages#players'

  match ':controller(/:action(/:id(.:format)))', via: [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
