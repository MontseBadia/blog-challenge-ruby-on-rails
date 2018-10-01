Rails.application.routes.draw do
  resources :posts do
    resource :likes
  end
  resources :users
  resource :session

  root "posts#index"

  post 'user/:id/follow' => 'users#follow', as: :follow_user
  delete 'user/:id/unfollow' => 'users#unfollow', as: :unfollow_user
end