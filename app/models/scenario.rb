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

class Scenario < ActiveRecord::Base
  belongs_to :community
  belongs_to :user
  belongs_to :room

  validates :name, :about, :system_id, :community, :user, presence: true
end
