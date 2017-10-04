Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  get "welcomes/index"
  root "welcomes#index"

  get '*path' => redirect('/')
end
