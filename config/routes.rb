Rails.application.routes.draw do

  get '/' => 'pages#index'
  get '/signup' => 'users#new'

  resources :users
  resources :posts
  
  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout'=> 'sessions#destroy'
end
