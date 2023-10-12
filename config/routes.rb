Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
end