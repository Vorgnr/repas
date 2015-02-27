Rails.application.routes.draw do
  resources :products

  root "welcome#index"
  resources :orders
  devise_for :users
end
