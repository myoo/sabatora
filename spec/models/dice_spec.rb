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

  describe "#roll_and_plus" do
    let(:dice){ Dice.new }
    let (:roll_set) {
      [{
         operand: "+",
         number_of_dice: 2,
         number_of_face: 6
       },
       {
         operand: "+",
         number_of_dice: 3,
         number_of_dice: 4
       }
      ]
    }

    it "2d6+3d4が正しく出力されること"
  end
end
