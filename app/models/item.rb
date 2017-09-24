class Item < ApplicationRecord
  belongs_to :product
  belongs_to :receipt

  validates_presence_of :product_id, :receipt_id
end
