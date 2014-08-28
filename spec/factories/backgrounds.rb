# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :background do
    room nil
    image "MyString"
    name "MyString"
    about "MyText"
    user nil
    access 1
    community nil
  end
end
