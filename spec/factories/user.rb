FactoryBot.define do
  factory :user do
    sequence(:user_name) { |n| "user#{n}" }
    email { '123@g.com' }
    password { 'password123' }
    payout_rate { 0.0 }
  end
end
