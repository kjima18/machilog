Rails.application.routes.draw do
  get "user/new"
  resources :users
end
