FactoryBot.define do
  factory :comment do
    text               {"落ちろよおおおおおおお"}
    association :product
    user { product.user }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
