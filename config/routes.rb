Rails.application.routes.draw do
  resources :posts
  resources :users
  resource :session

  root "posts#index"
end
