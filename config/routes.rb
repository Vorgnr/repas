Rails.application.routes.draw do
  resources :products

  root "welcome#index"
  resources :orders
  devise_for :users
  match 'cart/add/:id', :to => 'cart#add', 
                        :via => :get, 
                        :as => :post_contact
end

