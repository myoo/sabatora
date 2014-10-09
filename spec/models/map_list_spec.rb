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

require 'rails_helper'

RSpec.describe MapList, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
