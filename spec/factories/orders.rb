FactoryBot.define do
  factory :order do
    postal_code
    shipping_area_id    { 3 }
    municipality
    address
    building_name
    phone_number
  end
end
