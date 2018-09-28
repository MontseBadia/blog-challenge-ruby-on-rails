Rails.application.routes.draw do
  resources :posts
  resources :users
  root "posts#index"
end
