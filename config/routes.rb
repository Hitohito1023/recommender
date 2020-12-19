Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'

  get 'post_items/complete' => 'post_items#complete'

  get 'users/unsubscribe' => 'users#unsubscribe'
  get 'users/thanks' => 'users#thanks'
  patch 'users/withdraw' => 'users#withdraw'
  put 'users/withdraw' => 'users#withdraw'
  resources :users, only: [:index, :show, :edit, :update]

  resources :post_items

  resources :genres, only: [:create, :detroy]
end
