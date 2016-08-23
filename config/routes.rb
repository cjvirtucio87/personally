Rails.application.routes.draw do

  resources :bookmarks, only: [:create, :destroy]

  root to: 'sessions#new'

  get 'search' => 'businesses#index'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  post 'logout' => 'sessions#destroy'

  resources :users, except: [:show]

  get 'query_result' => 'businesses#query_result'

  resources :businesses
  
end
