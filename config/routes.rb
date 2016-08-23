Rails.application.routes.draw do

  resources :businesses do
    get 'query_result'
  end
  
end
