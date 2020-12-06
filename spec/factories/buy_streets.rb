FactoryBot.define do
  factory :buy_street do
    postal_code        { '123-4567' }
    prefecture_id      { 3 }
    municipality       { '津市'}
    address            { "1-1" }
    building           {'○○ビル'}
    phone_number       {"09000000000"}
    token              {"tok_abcdefghijk00000000000000000"}
    user_id            { 2 }
    item_id            { 4 }
  end
end
