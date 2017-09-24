require 'rails_helper'

RSpec.describe "receipts/index", type: :view do
  before(:each) do
    assign(:receipts, [
      Receipt.create!(
        :store => "Store",
        :base_amount => 2.5,
        :tax_amount => 3.5,
        :total_amount => 4.5
      ),
      Receipt.create!(
        :store => "Store",
        :base_amount => 2.5,
        :tax_amount => 3.5,
        :total_amount => 4.5
      )
    ])
  end

  it "renders a list of receipts" do
    render
    assert_select "tr>td", :text => "Store".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
  end
end
