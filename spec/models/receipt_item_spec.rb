require 'rails_helper'

RSpec.describe ReceiptItem, type: :model do

  before(:all) do
    @receipt = Receipt.create!(store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: 32.00, purchased_on: DateTime.now)
  end

  it "should raise an error without a receipt" do
    expect{ ReceiptItem.create!(name: 'Chicken', quantity: 1.5, unit: 'lbs', price: 12.0, receipt_id: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
