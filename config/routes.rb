Rails.application.routes.draw do
  #get '/articles', to: 'articles#index'
  post 'login', to: 'access_token#create'
  delete 'logout', to: 'access_token#destroy'
  #resources :articles, only: [:index, :show, :create, :update, :destroy]
  resources :articles
end
