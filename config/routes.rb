Rails.application.routes.draw do
  resources :receipt_items
  resources :receipts

  root to: "receipts#index"
end
