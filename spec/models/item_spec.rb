require 'rails_helper'

RSpec.describe Item, type: :model do

  before(:all) do
    @product = Product.create!(sku: '1234567', name: 'Chicken')
    @receipt = Receipt.create!(store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: 32.00, purchased_at: DateTime.now)
  end

  it "should raise an error without a product" do
    expect{ Item.create!(quantity: 1.5, unit: 'lbs', price: 12.0, product_id: nil, receipt_id: @receipt.id) }.to raise_error(ActiveRecord::RecordInvalid)
  end

    it "should raise an error without a receipt" do
    expect{ Item.create!(quantity: 1.5, unit: 'lbs', price: 12.0, product_id: @product.id, receipt_id: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
