# -*- coding: utf-8 -*-
class Dice

  def roll(number_of_dice, number_of_face)
    result = Array.new(number_of_dice) do
      @random.rand(1..number_of_face)
    end
  end

  def initialize
    # 乱数生成機を作成
    @random = Random.new
  end
end
