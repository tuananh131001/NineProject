FactoryBot.define do
  factory :card do
    product
    user
    name { "LV" }
    status { "needs_activation" }
    pin_code { rand(1000..9999) }
    activation_code { rand(1000..9999) }
  end
end
