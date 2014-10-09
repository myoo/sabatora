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

class MapList < ActiveRecord::Base
  belongs_to :map
  belongs_to :scenario

  validates :map, :scenario, presence: true
  validates :text, length: { maximum: 500 }, allow_blank: true
end
