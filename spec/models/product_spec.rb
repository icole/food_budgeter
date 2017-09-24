require 'rails_helper'

RSpec.describe Product, type: :model do
  it "should raise an error with a missing name" do
    expect { Product.create!(sku: '1234567', name: '') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
