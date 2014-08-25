# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    about "MyString"
    system_id 1
    community
    association :owner, factory: :user
    started_at "2014-08-13 19:55:23"
    finished_at "2014-08-13 19:55:23"
  end
end
