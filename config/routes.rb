Rails.application.routes.draw do
  devise_for :users

  get 'aboutus', to: 'pages#aboutus'
  get 'contact', to: 'pages#contact'

  # get 'shopping_cart', to: 'shopping_carts#show'
  # post 'cart/add'
  # post 'cart/remove'
  
  resource :shopping_cart, path: 'cart', only: [:show, :destroy]
  resources :shopping_cart_items, path: 'items', only: [:create, :update, :destroy]

  resources :users, only: [:show, :edit, :destroy, :destroy]
  resources :products
  resources :orders
  root "pages#index"
end
