# -*- coding: utf-8 -*-
module CthuluParser
  include ChatParser

  def self.included(mod)
    super
    @@default_reg = /\b([^\d]+.*?)[:：]\s*(\d+)\b/
    @@regist_reg = /[\[【]([^\d]*?\d*?)[:：]?\s*(\d+)\s*vs\s*([^\d]*?\d*?)[:：]?\s*(\d+)[\]】]/
    @@combine_reg =  /\b([^\d]+.*?)[:：]\s*(\d+)\s*and\s*([^\d]+.*?)[:：]\s*(\d+)\b/
    @@command_set.unshift(
                          { reg: @@combine_reg, func: "combine_judge" },
                          { reg: @@regist_reg, func: "regist_judge" },
                          { reg: @@default_reg, func: "default_judge" }
                          )
  end

  private
  def default_judge(line, dice)
    result = {}
    line.gsub!(@@default_reg) {
      result[:judge] = dice.default_judge($2.to_i)
      result[:skill] = $1
      result[:target] = $2
    }
    "【#{result[:skill]}:#{result[:target]}】 #{result[:judge][:judge]}, #{result[:judge][:result]}"
  end

  def regist_judge(line, dice)
    puts "regist_judge"
    result = {}
    line.gsub!(@@regist_reg) {
      result[:skill1] = $1
      result[:skill2] = $3
      result[:active] = $2
      result[:passive] = $4
      result[:judge] = dice.regist_judge($2.to_i, $4.to_i)
    }

    buf = "【#{result[:skill1]} #{result[:active]} vs #{result[:skill2]} #{result[:passive]}】#{result[:judge][:judge]}    結果: #{result[:judge][:result]}"

    buf += "　成功率: #{result[:judge][:target]}%"  if result[:judge][:target] > 5 and result[:judge][:target] < 95

    return buf
  end

  def combine_judge(line, dice)
    puts "combine judge"

    commands = line.split(/\s*and\s*/)
    targets = []
    skills = []
    commands.each do |command|
      command.gsub!(@@default_reg) {
        skills << $1
        targets << $2.to_i
      }
    end

    dice_result = dice.combine_judge(targets)

    "【#{skills.join(" and ")}】 #{dice_result[:result][:judge]}  目標値: #{dice_result[:target]}  結果: #{dice_result[:result][:result]}"
  end
end
