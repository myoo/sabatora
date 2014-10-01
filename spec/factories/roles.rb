# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :role do
    name "MyString"

    trait :member do
      name "member"
    end

    trait :administrator do
      name "administrator"
    end

    trait :owner do
      name "owner"
    end
  end
end
