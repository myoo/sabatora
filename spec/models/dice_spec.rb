# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Character do
  describe "#乱数" do
    before do
      @dice = Dice.new
      Redis.current.set("dice", Marshal.dump(@dice))
    end

    subject{ Marshal.load(Redis.current.get("dice")) }

    it "乱数生成機が保持されること" do
     expect(subject.instance_variable_get(:@random)).to eq(@dice.instance_variable_get(:@random))
    end
  end
end
