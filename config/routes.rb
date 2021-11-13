Rails.application.routes.draw do
  #get '/articles', to: 'articles#index'
  post 'login', to: 'access_token#create'
  resources :articles, only: [:index, :show]
end
