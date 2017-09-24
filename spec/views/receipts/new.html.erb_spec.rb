require 'rails_helper'

RSpec.describe "receipts/new", type: :view do
  before(:each) do
    assign(:receipt, Receipt.new(
      :store => "MyString",
      :base_amount => 1.5,
      :tax_amount => 1.5,
      :total_amount => 1.5
    ))
  end

  it "renders new receipt form" do
    render

    assert_select "form[action=?][method=?]", receipts_path, "post" do

      assert_select "input[name=?]", "receipt[store]"

      assert_select "input[name=?]", "receipt[base_amount]"

      assert_select "input[name=?]", "receipt[tax_amount]"

      assert_select "input[name=?]", "receipt[total_amount]"
    end
  end
end
