Rails.application.routes.draw do

  root to: 'sessions#new'

  get 'search' => 'businesses#index'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  post 'logout' => 'sessions#destroy'

  resources :users

  get 'query_result' => 'businesses#query_result'

  resources :businesses
  
end
