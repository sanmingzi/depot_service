Rails.application.routes.draw do
  resources :users
  resources :orders
  resources :line_items
  resources :carts
  resources :products

  root 'store#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
