FactoryBot.define do
  factory :product do
    brand
    name { "LV" }
    price { 0.0 }
    currency { "USD" }
    weight { 0.0 }
    sku { "LV-123" }
    description { "LV" }
    manufacturing_date { "2021-07-06 12:00:00" }
    status { "active" }
  end
end
