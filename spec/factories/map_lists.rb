# == Schema Information
#
# Table name: map_lists
#
#  id          :integer          not null, primary key
#  map_id      :integer          not null
#  scenario_id :integer          not null
#  order_no    :integer
#  comment     :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_map_lists_on_map_id       (map_id)
#  index_map_lists_on_scenario_id  (scenario_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :map_list do
    map nil
    scenario nil
    order_no 1
    comment "MyText"
  end
end
