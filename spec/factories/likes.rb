FactoryBot.define do
  factory :like do
    association :product
    user { product.user }
  end
end
