Rails.application.routes.draw do
  root "welcome#index"
  resources :orders
  devise_for :users
end
