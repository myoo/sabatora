# -*- coding: utf-8 -*-
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

require 'rails_helper'

RSpec.describe Scenario, :type => :model do
  describe "#avairable" do
    let(:user){ FactoryGirl.create(:user) }

    before do
      FactoryGirl.create(:joining, user: user)
    end

    context "自分の作成したシナリオ" do
      let(:public_scenario){ FactoryGirl.create(:scenario, access: ACCESS_LEVEL[:PUBLIC], user: user) }
      let(:community_scenario){ FactoryGirl.create(:scenario, access: ACCESS_LEVEL[:COMMUNITY_ONLY], user: user, community: user.communities.first) }
      let(:user_scenario){ FactoryGirl.create(:scenario, access: ACCESS_LEVEL[:USER_ONLY], user: user) }

      it "アクセスレベル全て含まれること" do
        expect(Scenario.available(user)).to include(public_scenario, community_scenario, user_scenario)
      end
    end

    context "他人が作成したシナリオ" do
      let(:public_scenario){ FactoryGirl.create(:scenario, access: ACCESS_LEVEL[:PUBLIC]) }
      let(:community_scenario) { FactoryGirl.create(:scenario,
                                                    access: ACCESS_LEVEL[:COMMUNITY_ONLY],
                                                    community: user.communities.first)}
      let(:not_joined_community_scenario) { FactoryGirl.create(:scenario,
                                                               access: ACCESS_LEVEL[:COMMUNITY_ONLY])}
      let(:user_scenario){ FactoryGirl.create(:scenario, access: ACCESS_LEVEL[:USER_ONLY]) }

      it "公開シナリオが含まれること" do
        expect(Scenario.available(user)).to include(public_scenario)
      end

      it "所属するコミュニティのシナリオが含まれること" do
        expect(Scenario.available(user)).to include(community_scenario)
      end

      it "所属していないコミュニティのシナリオは含まれないこと" do
        expect(Scenario.available(user)).not_to include(not_joined_community_scenario)
      end

      it "ユーザーオンリーのシナリオが含まれないこと" do
        expect(Scenario.available(user)).not_to include(user_scenario)
      end
    end
  end
end
