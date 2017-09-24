require 'rails_helper'

RSpec.describe Receipt, type: :model do

  it "should raise an error with a missing total amount" do
    expect { Receipt.create!(store: "Madison Co-op", base_amount: 30.00, tax_amount: 2.00, total_amount: nil, purchased_at: DateTime.now) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
