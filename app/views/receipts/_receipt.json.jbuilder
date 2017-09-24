json.extract! receipt, :id, :store, :base_amount, :tax_amount, :total_amount, :purchased_at, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
