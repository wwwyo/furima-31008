FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password }
    password_confirmation { password }
    nickname { Faker::Name.name }
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    last_name_kana { person.last.katakana }
    first_name_kana { person.first.katakana }
    birth_day { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
