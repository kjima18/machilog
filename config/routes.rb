Rails.application.routes.draw do
  get '/' => 'pages#index'
  get '/about' => 'pages#about'
  
  get '/signup' => 'users#new'

  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout'=> 'sessions#destroy'
  
  get 'posts/:post_id/comments/new' => 'comments#new', as: :'new_post_comment'
  post 'posts/:post_id/comments/new' => 'comments#create'
  delete 'posts/:post_id/comments/destroy' => 'comments#destroy'
  
  resources :users
  resources :posts
  
end
