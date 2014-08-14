# -*- coding: utf-8 -*-
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
