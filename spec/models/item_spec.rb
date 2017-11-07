require 'rails_helper'

RSpec.describe Item, type: :model do

  before(:all) do
    @receipt = Receipt.create!(store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: 32.00, purchased_at: DateTime.now)
  end

  it "should raise an error without a receipt" do
    expect{ Item.create!(sku: '1234567', name: 'Chicken', quantity: 1.5, unit: 'lbs', price: 12.0, receipt_id: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
