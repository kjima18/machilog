Rails.application.routes.draw do
  get '/' => 'pages#index'
  get '/signup' => 'users#new'

  resources :users
end
