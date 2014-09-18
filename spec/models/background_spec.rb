# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: backgrounds
#
#  id           :integer          not null, primary key
#  room_id      :integer
#  image        :string(255)
#  name         :string(255)
#  about        :text
#  user_id      :integer
#  access       :integer
#  community_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_backgrounds_on_community_id  (community_id)
#  index_backgrounds_on_room_id       (room_id)
#  index_backgrounds_on_user_id       (user_id)
#

require 'rails_helper'

RSpec.describe Background, :type => :model do
  describe "#create" do
    let(:room){ FactoryGirl.create(:room) }

    it "roomにbackgroundがない時はactive_backgroundにセットされること" do
      background = Background.create(name: "テスト", image: File.open(File.join(Rails.root, 'spec/support/testfiles/flower.jpg')), room: room)
      expect(room.active_background).to eq(background)
    end
  end
end
