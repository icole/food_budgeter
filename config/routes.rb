Rails.application.routes.draw do
  resources :kitchen_items
  resources :receipt_items
  resources :receipts

  root to: "receipts#index"
end
