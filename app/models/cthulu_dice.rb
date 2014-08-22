# -*- coding: utf-8 -*-
class CthuluDice < Dice

  ############### クトゥルフ神話TRPGダイス ###############

  def default_judge(target)
    result = roll(1, 100)
    if result[0] <= 5                    # 決定的成功 rulebook p149
      return { judge: "決定的成功", result: result[0] }
    elsif result[0] <= target.div(5)        # 貫通　rulebook p37
      return { judge: "クリティカル", result: result[0] }
    elsif result[0] <= target
      return { judge: "成功", result: result[0] }
    elsif result[0] >= 96                  # ファンブル rulebook p149
      return { judge: "ファンブル", result: result[0] }
    else
      return { judge: "失敗", result: result[0] }
    end
  end

  def regist_judge(active, passive) # 抵抗ロール
    target = 50 + active*5 - passive*5 # 抵抗の基本成功率 rolebook p59

    result = roll(1,100)

    if target < 5
      return { judge: "自動失敗", target: target, result: result[0]}
    elsif target > 95
      return { judge: "自動成功", target: target, result: result[0] }
    elsif result[0] < target
      return { judge: "成功", target: target, result: result[0] }
    else
      return { judge: "失敗", target: target, result: result[0] }
    end
  end

  def combine_judge(targets)
    target = targets.min
    { target: target, result: default_judge(target)}
  end
end
