FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.email }
    password { '12345a' }
    password_confirmation { '12345a' }
    nickname { Faker::Name.name }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_day { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
