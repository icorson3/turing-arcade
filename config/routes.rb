Rails.application.routes.draw do
  root to: "users#show"

  namespace :api do
    namespace :v1 do
      resources :games, except: [:edit, :new], defaults: { format: :json }
    end
  end
  resources :games, only: [:index]

  resources :users, only: [:index, :create]

  get "/dashboard", to: "users#show", as: "dashboard"
  get '/auth/github', as: "github_login"
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/:game_slug', to: 'games#show', as: "game"
end
