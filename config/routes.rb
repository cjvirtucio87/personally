Rails.application.routes.draw do

  resources :users

  resources :businesses do
    get 'query_result'
  end
  
end
