# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    user nil
    room ""
    player_role nil
    character nil
  end
end
