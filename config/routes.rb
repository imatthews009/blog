Rails.application.routes.draw do
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  get "welcomes/index"
  root "welcomes#index"
end
