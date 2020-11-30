FactoryBot.define do
    factory :user do
      nickname              {Faker::Name.name}
      email                 {Faker::Internet.free_email}
      password              {"tanaka123"}
      password_confirmation {password}
      first_name            {"田中"}
      last_name             {"太郎"}
      first_name_kana       {"タナカ"}
      last_name_kana        {"タロウ"}
      birthday              {Faker::Date.birthday}
    end
  end