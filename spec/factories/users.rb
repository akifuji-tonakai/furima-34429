FactoryBot.define do
  factory :user do
    nickname                {Faker::Games::SuperSmashBros.fighter}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation   {password}
    birthday                {'1930-01-01'}
    real_first_name         {'陸太郎'}
    real_family_name        {'山田'}
    first_furigana          {'リクタロウ'}
    family_furigana         {'ヤマダ'}
  end
end