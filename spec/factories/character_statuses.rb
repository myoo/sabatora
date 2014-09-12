# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character_status, :class => 'Character::Status' do
    illustration nil
    character nil
  end
end
