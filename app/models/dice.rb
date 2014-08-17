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

  # [[operand, number_of_dice, number_of_face, alone_number],...]
  def roll_and_plus(number_set)
    result_number = 0
    result_roll = []
    number_set.each do |set|
      unless set[:number_of_dice].nil? or set[:number_of_face].nil?
        result_roll << roll(set[:number_of_dice], set[:number_of_face])
        result_number = set[:operand].to_proc.call(result_number, result_roll.last.inject(:+))
      else
        result_number = set[:operand].to_proc.call(result_number, set[:alone_number])
      end
    end
    "#{result_number}: #{result_roll}"
  end
end
