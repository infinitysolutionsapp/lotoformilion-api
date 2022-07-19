Rails.application.routes.draw do
  resources :bets
  resources :games
  resources :game_categories
  resources :game_houses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
