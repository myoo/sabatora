# -*- coding: utf-8 -*-
class Dice

  class DiceNumberTooLargeError < StandardError; end

  def roll(number_of_dice, number_of_face)
    if number_of_dice > 100 or number_of_face > 10000
      raise DiceNumberTooLargeError
    end

    result = Array.new(number_of_dice) do
      @random.rand(1..number_of_face)
    end
    return result.inject(:+), result
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
        buf = roll(set[:number_of_dice], set[:number_of_face])
        result_number = set[:operand].to_proc.call(result_number, buf[1].inject(:+))
        result_roll << buf[1]
      else
        result_number = set[:operand].to_proc.call(result_number, set[:alone_number])
      end
    end
    #    "#{result_number}: #{result_roll}"
    {result: result_number, dice: result_roll}
  end
end
