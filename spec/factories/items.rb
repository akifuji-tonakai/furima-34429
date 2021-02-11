FactoryBot.define do
  factory :item do
    name                  {Faker::Book.title}
    introduction          {Faker::Movies::StarWars.wookiee_sentence}
    category_id           {Faker::Number.within(range: 2..10)}
    status_id             {Faker::Number.within(range: 2..7)}
    shipping_fee_id       {Faker::Number.within(range: 2..3)}
    shipping_days_id      {Faker::Number.within(range: 2..4)}
    send_from_id          {Faker::Number.within(range: 2..48)}
    price                 {Faker::Number.within(range: 300..9999999)}

    association :user

    after(:build) do |item|
      item.item_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end