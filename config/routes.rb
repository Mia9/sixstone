Rails.application.routes.draw do
  devise_for :users

  get 'aboutus', to: 'pages#aboutus'
  get 'contact', to: 'pages#contact'

  get 'cart', to: 'carts#show'
  post 'cart/add'
  post 'cart/remove'
  
  resources :users, only: [:show, :edit, :destroy]
  resources :products
  resources :order_items
  resources :orders
  root "pages#index"
end
