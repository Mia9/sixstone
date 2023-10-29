Rails.application.routes.draw do
  devise_for :users

  get 'aboutus', to: 'pages#aboutus'
  get 'contact', to: 'pages#contact'

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  
  resources :products
  resources :order_items
  resources :orders
  root "pages#index"
end
