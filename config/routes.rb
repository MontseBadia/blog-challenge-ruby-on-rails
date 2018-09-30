Rails.application.routes.draw do
  resources :posts do
    resource :likes
  end
  resources :users
  resource :session

  root "posts#index"
end