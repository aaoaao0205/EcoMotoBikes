Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items
  resources :carts, only: [:show]
  resources :cart_items, only: [:create, :update, :destroy]
  get 'items/:id/add_to_cart', to: 'carts#add_item', as: 'add_to_cart'
end