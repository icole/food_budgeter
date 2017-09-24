require 'rails_helper'

RSpec.describe "receipts/show", type: :view do
  before(:each) do
    @receipt = assign(:receipt, Receipt.create!(
      :store => "Store",
      :base_amount => 2.5,
      :tax_amount => 3.5,
      :total_amount => 4.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Store/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
  end
end
