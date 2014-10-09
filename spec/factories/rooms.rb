# == Schema Information
#
# Table name: rooms
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  about                :string(255)
#  owner_id             :integer          not null
#  system_id            :integer          default(0)
#  community_id         :integer          not null
#  started_at           :datetime
#  finished_at          :datetime
#  created_at           :datetime
#  updated_at           :datetime
#  active_background_id :integer
#  scenario_id          :integer
#
# Indexes
#
#  index_rooms_on_community_id  (community_id)
#  index_rooms_on_owner_id      (owner_id)
#  index_rooms_on_scenario_id   (scenario_id)
#

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
