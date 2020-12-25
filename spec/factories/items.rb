FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'test_image.png')
    end
    association :user
    item          {"着物"}
    detail        {Faker::Lorem.sentence}
    price         {Faker::Number.number(digits: 7)}
    category_id   {Faker::Number.between(from: 1, to: 10)}
    condition_id  {Faker::Number.between(from: 1, to: 6)}
    shipping_id   {Faker::Number.between(from: 1, to: 2)}
    prefecture_id {Faker::Number.between(from: 1, to: 47)}
    day_id        {Faker::Number.between(from: 1, to: 3)}
  end
end
