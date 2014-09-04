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
#
# Indexes
#
#  index_rooms_on_community_id  (community_id)
#  index_rooms_on_owner_id      (owner_id)
#

require 'rails_helper'

RSpec.describe Room, :type => :model do
  describe "parse chat messages" do
    it_behaves_like "parse chat"
  end
end
