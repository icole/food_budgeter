json.extract! item, :id, :store, :sku, :name, :quantity, :price, :receipt_id, :created_at, :updated_at
json.url item_url(item, format: :json)
