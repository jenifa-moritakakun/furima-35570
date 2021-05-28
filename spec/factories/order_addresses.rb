FactoryBot.define do
  factory :order_address do
    postal_code         { '123-4567' }
    shipping_area_id    { 3 }
    municipality        { '市区町村' }
    address             { '番地' }
    building_name       { '建物名' }
    phone_number        { Faker::PhoneNumber(max_length: 11) }
  end
end
