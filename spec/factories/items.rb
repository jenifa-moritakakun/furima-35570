FactoryBot.define do
  factory :item do
    name                { Faker::Name.name }
    description         { '商品の説明' }
    details_category_id { '3' }
    details_status_id   { '3' }
    shipping_charges_id { '3' }
    shipping_area_id    { '3' }
    shipping_days_id    { '3' }
    selling_price       { '300' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-intro04.png'), filename: 'furima-intro04.png')  
    end
  end
end
