FactoryBot.define do
  factory :order_address do
    post_number              {"111-1111"}
    send_from_id             {Faker::Number.within(range: 2..48)}
    village_name             {Faker::Nation.nationality}
    village_number           {Faker::Nation.capital_city}
    tele_number              {Faker::Number.leading_zero_number(digits: 9)}
    token                    {"tok_abcdefghijk00000000000000000"}
  end
end