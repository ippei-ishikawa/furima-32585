FactoryBot.define do
  factory :purchase_address do
    postal_code   { '100-0001' }
    prefecture_id { 12 }
    city          { '千代田区' }
    house_number  { '此処１ー１' }
    building_name { '皇居' }
    phone_number  { Faker::Number.number(digits: 11) }
    token         { 'tok_abcdefghijk00000000000000000' }
    user_id       { 1 }
    item_id       { 2 }
  end
end
