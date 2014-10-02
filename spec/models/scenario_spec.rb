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
#
# Indexes
#
#  index_scenarios_on_community_id  (community_id)
#  index_scenarios_on_user_id       (user_id)
#

require 'rails_helper'

RSpec.describe Scenario, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
