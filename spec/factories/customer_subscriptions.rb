FactoryBot.define do
  factory :customer_subscription do
    customer_id { nil }
    subscription_id { nil }
    start_date { "2021-06-07" }
    status { false }
  end
end
