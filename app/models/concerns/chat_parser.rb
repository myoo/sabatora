# -*- coding: utf-8 -*-
module ChatParser
  extend ActiveSupport::Concern

  @@command_set = [
                   { reg: /\b(\d+)d(\d+).*(=?[>|<]=?)(\d+)\b/, func: "normal_judge" },
                   { reg: /\b(\d+)d(\d+)[+|-](\d+)|(\d+)d(\d+)\b/, func: "ndm_dice_plus" },
                   { reg: /\b(\d+)d(\d+)/, func: "ndm_dice" }
                 ]

  def parse(str, dice)
    lines = str.rstrip.split(/\r?\n/).map {|line| line.chomp }
    buf = []
    until lines.empty?
      buf.push parse_line(lines.shift, dice)
    end
    buf.join("\n")
  end

  private
  def parse_line(line, dice)
    line = line.html_safe       # エスケープ
    Obscenity.sanitize(line)
    parse_command(line, dice)
  end

  def parse_command(line, dice)
    return line if dice.nil?

    src = line.downcase
    @@command_set.each do |command|
      if command[:reg].match src
        return self.send(command[:func], src, dice)
      end
    end
    return src
  end

  def ndm_dice(line, dice)
    line.gsub!(/\b(\d+)d(\d+)\b/) {
      result = dice.roll($1.to_i, $2.to_i)
      "【#{$1}D#{$2}】 合計:#{result[0]},　#{result[1]}"
    }
  end

  def ndm_dice_plus(line, dice)
    result = roll_and_plus(line, dice)
    "【#{line}】結果：#{result[:result]},　#{result[:dice]}"
  end

  def normal_judge(line, dice)
    number_src, comparison, target = line.split(/(=?[>|<]=?)/)
    number_set = []
    parse_number_set(number_src, number_set)
    result = dice.normal_judge(comparison.to_sym, target.to_i, number_set)
    unless result[:judge]
      "成功！：【#{line}】　結果: #{result[:result][:result]},　#{result[:result][:dice]}"
    else
      "失敗：【#{line}】　結果: #{result[:result][:result]},　#{result[:result][:dice]}"
    end
  end

  private
  def roll_and_plus(line, dice)
    number_set = []
    parse_number_set(line, number_set)
    dice.roll_and_plus(number_set)
  end

  def parse_number_set(line, number_set)
    commands = ["+"]            # 前方のオペランドを参照するため挿入しておく
    commands << line.split(/([+|-])/)
    commands.flatten.each_slice(2) do |operand, command|
      if command
        command.gsub!(/((\d+)d(\d+))|(\d+)/) {
          if !$2.nil? && !$3.nil?
            number_set << {
              operand: operand.to_sym,
              number_of_dice: $2.to_i,
              number_of_face: $3.to_i
            }
          elsif !$4.nil?
            number_set << {
              operand: operand.to_sym,
              alone_number: $4.to_i
            }
          end
        }
      end
    end
  end
end
