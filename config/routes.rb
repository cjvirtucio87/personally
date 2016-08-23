Rails.application.routes.draw do

  root to: 'sessions#new'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  post 'logout' => 'sessions#destroy'

  resources :users

  resources :businesses do
    get 'query_result'
  end
  
end
