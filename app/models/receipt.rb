class Receipt < ApplicationRecord
  has_many :items
  validates_presence_of :total_amount
end
