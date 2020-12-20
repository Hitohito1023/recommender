Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'

  get 'post_items/complete' => 'post_items#complete'

  resources :users, only: [:index, :show, :edit, :update]
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'users_unsubscribe'
  get 'users/thanks' => 'users#thanks', as: 'users_thanks'
  patch 'users/:id/withdraw' => 'users#withdraw', as: 'users_withdraw'


  resources :post_items

  resources :genres, only: [:index, :new, :create, :detroy]
end


