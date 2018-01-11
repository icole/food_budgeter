FactoryGirl.define do
  factory :kitchen_item do
    name "MyString"
    purchased_quantity 1.5
    used_quantity 1.5
    unit "MyString"
    receipt_item nil
  end
end
