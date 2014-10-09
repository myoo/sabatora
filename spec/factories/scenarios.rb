# == Schema Information
#
# Table name: scenarios
#
#  id           :integer          not null, primary key
#  community_id :integer
#  user_id      :integer
#  access       :integer
#  name         :string(255)
#  about        :string(255)
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  system_id    :integer
#
# Indexes
#
#  index_scenarios_on_community_id  (community_id)
#  index_scenarios_on_user_id       (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scenario do
    community
    user
    access 1
    system_id 1
    name "MyString"
    about "MyString"
    description "MyText"

    trait :public do
      access ACCESS_LEVEL[:PUBLIC]
    end
  end
end
