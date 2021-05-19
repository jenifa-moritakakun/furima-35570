FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password}
    password_confirmation  {password}
    family_name            {'亞アあ'}
    first_name             {'亞アあ'}
    family_name_full_width {'テスト'}
    first_name_full_width  {'テスト'}
    birth_day              {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end