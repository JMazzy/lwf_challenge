Rails.application.routes.draw do
  root to: "shipping_addresses#index"

  resources :customers
  resources :addresses
  resources :shipping_addresses
end
