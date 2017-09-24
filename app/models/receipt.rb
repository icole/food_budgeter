class Receipt < ApplicationRecord

  validates_presence_of :total_amount
end
