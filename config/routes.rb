Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts do
      resource :likes
    end
    resources :users do
      get 'wall' => 'users#wall', as: :wall
    end
    resource :session

    root 'posts#index'

    post 'user/:id/follow' => 'users#follow', as: :follow_user
    delete 'user/:id/unfollow' => 'users#unfollow', as: :unfollow_user
  end
end