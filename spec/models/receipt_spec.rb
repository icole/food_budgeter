require 'rails_helper'

RSpec.describe Receipt, type: :model do
  let(:receipt_items_attributes) {
    [
     {name: "Chicken", quantity: 2.0, unit: "lb", price: 20.0},
     {name: "Beer", quantity: 6.0, unit: "cans", price: 10.0},
    ]
  }

  let(:valid_attributes) {
    {store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: 32.00, purchased_on: DateTime.now, receipt_items_attributes: receipt_items_attributes}
  }

  it "should raise an error with a missing total amount" do
    expect { Receipt.create!(store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: nil, purchased_on: DateTime.now) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "should create passed in receipt items" do
    expect{Receipt.create!(valid_attributes)}.to change{ReceiptItem.count}.from(0).to(2)
  end
end
