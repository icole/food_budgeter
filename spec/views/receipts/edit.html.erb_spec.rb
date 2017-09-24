require 'rails_helper'

RSpec.describe "receipts/edit", type: :view do
  before(:each) do
    @receipt = assign(:receipt, Receipt.create!(
      :store => "MyString",
      :base_amount => 1.5,
      :tax_amount => 1.5,
      :total_amount => 1.5
    ))
  end

  it "renders the edit receipt form" do
    render

    assert_select "form[action=?][method=?]", receipt_path(@receipt), "post" do

      assert_select "input[name=?]", "receipt[store]"

      assert_select "input[name=?]", "receipt[base_amount]"

      assert_select "input[name=?]", "receipt[tax_amount]"

      assert_select "input[name=?]", "receipt[total_amount]"
    end
  end
end
