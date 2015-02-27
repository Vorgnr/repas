Rails.application.routes.draw do
  resources :products

  root "welcome#index"
  resources :orders
  get '/orders/:id/direction', to: 'orders#direction', as: 'direction'
  devise_for :users
end
