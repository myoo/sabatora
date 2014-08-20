# -*- coding: utf-8 -*-
module CthuluParser
  include ChatParser

  def self.included(mod)
    super
    @@default_reg = /\b([^\d]+.*?)[:：]\s*(\d+)\b/
    @@regist_reg = /[\[【]([^\d]*?\d*?)[:：]?\s*(\d+)\s*vs\s*([^\d]*?\d*?)[:：]?\s*(\d+)[\]】]/
    @@command_set.unshift(
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
end
