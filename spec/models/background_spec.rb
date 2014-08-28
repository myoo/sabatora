# -*- coding: utf-8 -*-
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
