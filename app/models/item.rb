class Item < ApplicationRecord
  belongs_to :receipt

  validates_presence_of :receipt_id
end
