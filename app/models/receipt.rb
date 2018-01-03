class Receipt < ApplicationRecord
  has_many :receipt_items, dependent: :destroy

  accepts_nested_attributes_for :receipt_items, allow_destroy: true

  validates_presence_of :total_amount
end
