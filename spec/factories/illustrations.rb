# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :illustration do
    user nil
    access 1
    name "MyString"
    description "MyText"
    image "MyString"
  end
end
