class Receipt < ApplicationRecord
  has_many :items, dependent: :destroy

  accepts_nested_attributes_for :items, allow_destroy: true

  validates_presence_of :total_amount
end
