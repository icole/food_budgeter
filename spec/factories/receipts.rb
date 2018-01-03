FactoryGirl.define do
  factory :receipt do
    store "MyString"
    base_amount 1.5
    tax_amount 1.5
    total_amount 1.5
    purchased_on "2017-09-23 18:03:54"
  end
end
