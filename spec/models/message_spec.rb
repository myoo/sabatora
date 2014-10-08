# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Message, :type => :model do
  describe "#resent_logs" do
    before do
      FactoryGirl.create_list(:message, 510)
    end

    it "最新500件が表示されること" do
      expect(Array(Message.recent_logs(1)).count).to be 500
      expect(Message.recent_logs(1).first.body).to include("510")
#      expect(Message.recent_logs(1).first.body).to include(/10|9/)
    end
  end
end
