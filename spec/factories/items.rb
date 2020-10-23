FactoryBot.define do
  factory :item do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'), 'test/jpg') }
    title { Faker::Lorem.word }
    text { Faker::Lorem.paragraph }
    genre_id  { Faker::Number.within(range: 2..11) }
    state_id { Faker::Number.within(range: 2..7) }
    shipping_fee_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_date_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9999999) }
    association :user
  end
end
