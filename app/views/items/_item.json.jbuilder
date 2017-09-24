json.extract! item, :id, :quantity, :price, :product_id, :receipt_id, :created_at, :updated_at
json.url item_url(item, format: :json)
