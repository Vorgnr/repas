Rails.application.routes.draw do
  resources :products
  wash_out :delivery
  wash_out :order
  root "welcome#index"
  resources :orders
  get '/alldirection', to: 'orders#alldirection', as: 'alldirection'
  get '/orders/:id/direction', to: 'orders#direction', as: 'direction'
  devise_for :users
  match 'cart/add/:id', :to => 'cart#add', 
                        :via => :get, 
                        :as => :post_contact
end

