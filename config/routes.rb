Rails.application.routes.draw do
  resources :posts
  get "welcomes/index"
  root "welcomes#index"
end
