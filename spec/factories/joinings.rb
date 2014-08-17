# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :joining do
    user nil
    communitiy nil
    role nil
    comment "MyText"
  end
end
