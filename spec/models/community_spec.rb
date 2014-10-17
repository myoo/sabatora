# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: communities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  about       :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  header      :string(255)
#  icon        :string(255)
#

require 'rails_helper'

RSpec.describe Community, :type => :model do
  describe "association" do
    it { should have_many(:rooms).dependent(:destroy) }
    it { should have_many(:backgrounds).dependent(:destroy)}
    it { should have_many(:joinings).dependent(:delete_all) }
  end

  describe "owner" do
    let(:owner) { FactoryGirl.create(:user) }
    let(:community) { FactoryGirl.create(:community) }

    before do
      FactoryGirl.create(:joining, :owner, user: owner, community: community)
    end
    it "オーナーは一人のみ" do
      another = FactoryGirl.create(:user)
      expect{ FactoryGirl.create(:joining, :owner, user: another, community: community)}.to raise_error
    end

    describe "オーナーが退会した場合" do

      it "一番古いユーザーにオーナーが変更されること" do
        last_one = FactoryGirl.create(:user)
        FactoryGirl.create(:joining, user: last_one, community: community)
        owner.joinings.find_by(community: community).destroy
        expect(community.is_owner?(last_one)).to be_truthy
      end
    end
  end

end
