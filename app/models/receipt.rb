class Receipt < ApplicationRecord
  has_many :receipt_items, dependent: :destroy

  accepts_nested_attributes_for :receipt_items, allow_destroy: true

  validates_presence_of :total_amount

  after_create :create_kitchen_items

  def create_kitchen_items
    self.receipt_items.each do |receipt_item|
      KitchenItem.create(
                         name: receipt_item.name,
                         purchased_quantity: receipt_item.quantity,
                         unit: receipt_item.unit,
                         receipt_item: receipt_item
                        )
    end
  end
end
