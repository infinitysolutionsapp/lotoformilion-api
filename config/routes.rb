Rails.application.routes.draw do
  resources :testimonials
  resources :transactions
  resources :events
  
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
  get '/games/new', to: 'games#new'

  resources :game_houses
  resources :game_categories
  resources :games
  resources :bets 

  post '/braip', to: 'braip#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
