# -*- coding: utf-8 -*-
class CthuluSystem < System

  private
    ###### TRPGタイトル #####
  def set_title
    "クトゥルフ神話TRPG"
  end

  ###### 説明 #####
  def set_about
    <<EOS

クトゥルフ神話TRPG
ToDo:説明をかく
EOS
  end

  ###### ダイスヘルプ #####
  def set_help
    <<EOS
とりあえず nDmでダイス振れる
nDm+nDm+.......で合計値
nDm>10 とかで成功・失敗判定

技能: 60  (数字は自分の技能値)とかで判定
[str:12 vs str:8] or [12 vs 8] で抵抗ロール
ToDo:説明かく
EOS
  end

  def new_dice
    CthuluDice.new
  end

  def include_parser(room)
    room.class_eval do
      include CthuluParser
    end
  end


end
