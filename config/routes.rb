Rails.application.routes.draw do
  resources :items
  resources :receipts

  root to: "receipts#index"
end
