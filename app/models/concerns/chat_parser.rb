# -*- coding: utf-8 -*-
module ChatParser
  extend ActiveSupport::Concern

  @@command_set = [
                   { reg: /\b(\d+)d(\d+)[+|-](\d+)|(\d+)d(\d+)\b/, func: "ndm_dice_plus" },
                   { reg: /\b(\d+)d(\d+)/, func: "ndm_dice" }
                 ]

  def parse(str, dice)
    lines = str.rstrip.split(/\r?\n/).map {|line| line.chomp }
    buf = []
    until lines.empty?
      buf.push parse_line(lines.shift, dice)
    end
    buf
  end

  private
  def parse_line(line, dice)
    line = line.html_safe       # エスケープ
    Obscenity.sanitize(line)
    parse_command(line, dice)
  end

  def parse_command(line, dice)
    @@command_set.each do |command|
      src = line.downcase
      if command[:reg].match src
        return self.send(command[:func], src, dice)
      end
      return src
    end
  end

  def ndm_dice(line, dice)
    line.gsub!(/\b(\d+)d(\d+)\b/) {
      result = dice.roll($1.to_i, $2.to_i)
      "【#{$1}D#{$2}】 合計:#{result[0]}, #{result[1]}"
    }
  end

  def ndm_dice_plus(line, dice)
    number_set = []
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
    result = dice.roll_and_plus(number_set)
    "【#{line}】結果：#{result[:result]}, #{result[:dice]}"
  end
end
