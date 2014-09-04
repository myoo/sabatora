# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: joinings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  community_id :integer
#  role_id      :integer
#  comment      :text
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_joinings_on_community_id  (community_id)
#  index_joinings_on_role_id       (role_id)
#  index_joinings_on_user_id       (user_id)
#

require 'rails_helper'

RSpec.describe Joining, :type => :model do
  describe "validation" do
    let(:user) { FactoryGirl.create(:user) }
    let(:community) { FactoryGirl.create(:community) }
    it "同じユーザーを二回コミュニティに登録できないこと" do
      Joining.create(user_id: user.id, community_id: community.id, role_id: 2)
      joining =  Joining.create(user_id: user.id, community_id: community.id, role_id: 3)
      expect(joining).not_to be_valid
    end
  end
end
