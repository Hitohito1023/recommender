Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'
  get 'home/ranking' => 'home#ranking'

  get 'search/search'
  get '/search', to: 'search#search'

  get 'post_items/complete' => 'post_items#complete', as: 'post_items_complete'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  end

  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'users_unsubscribe'
  get 'users/thanks' => 'users#thanks', as: 'users_thanks'
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'users_withdraw'


  resources :post_items do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :genres, only: [:index, :new, :edit, :create, :update, :destroy]
end
