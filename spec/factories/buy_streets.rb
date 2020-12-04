FactoryBot.define do
  factory :buy_street do
    postal_code        { '111-444' }
    prefecture         { 3 }
    municipality       { '津市'}
    address            { 1-1 }
    phone_number       {"09000000000"}
  end
end
