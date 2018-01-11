class ReceiptItem < ApplicationRecord
  belongs_to :receipt
  has_one :kitchen_item, dependent: :destroy
end
