Rails.application.routes.draw do
  resources :posts
  resources :projects
  get "welcomes/index"
  root "welcomes#index"
end
