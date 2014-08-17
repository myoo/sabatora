# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    user nil
    name "MyString"
    about "MyString"
    system_id 1
  end
end
