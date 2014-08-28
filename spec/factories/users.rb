# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user_#{n}" }
    sequence(:email) { |n| "mail_#{n}@example.com" }
    password               "password"
    password_confirmation  "password"
    confirmed_at Time.now
  end
end
