Rails.application.routes.draw do
  
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  resources :game_houses do
    resources :game_categories do
      get '/games/new', to: 'games#new'
      resources :games
      resources :games do
        resources :bets 
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
