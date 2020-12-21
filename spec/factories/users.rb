FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    family_name           {Gimei.last.kanji}
    given_name            {Gimei.first.kanji}
    kana_family_name      {Gimei.last.katakana}
    kana_given_name       {Gimei.first.katakana}
    birthday              {Faker::Date.in_date_period}
  end
end
