Rails.application.routes.draw do
  resources :items
  resources :products
  resources :receipts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
