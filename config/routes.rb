Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => 'home#about'

  get 'post_items/complete' => 'post_items#complete'

  devise_for :users
  get 'users/unsubscribe' => 'users#unsubscribe'
  get 'users/thanks' => 'users#thanks'
  patch 'users/withdraw' => 'users#withdraw'
  put 'users/withdraw' => 'users#withdraw'
  resources :users, only: [:index, :show, :edit, :update]

  resources :post_items

  resources :genres, only: [:create, :detroy]
end
