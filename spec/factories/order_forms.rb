FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    delivery_prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_town { Faker::Lorem.word }
    delivery_number { Faker::Lorem.word }
    delivery_building { Faker::Lorem.word }
    phon_number { Faker::Number.number(digits: 11) }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
