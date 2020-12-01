FactoryBot.define do
  factory :item do
    item_name       {Faker::Lorem.sentence}
    explanation     {Faker::Lorem.sentence}
    image           {Faker::Lorem.sentence}
    category_id     {2}
    status_id       {2}
    delivery_fee_id {2}
    prefecture_id   {2}
    delivery_day_id {2}
    price           {1234567}
    association :user
  end
end
