# -*- coding: utf-8 -*-
class PlaneSystem < System

  private

  ###### TRPGタイトル #####
  def set_title
    "基本システム"
  end

  ###### 説明 #####
  def set_about
    <<EOS

基本のシステム。
ダイスが振れ、大小の判定が出来ます
EOS
  end

  ###### ダイスヘルプ #####
  def set_help
    <<EOS
nDmでダイスが振れます。
例）1d100 2d6

nDm+nDm+.......で合計値が出せます。
例）1d6+6

nDm>x で成功・失敗判定
例）1d100>50
EOS
  end

  def new_dice
    Dice.new
  end

  def include_parser(room)
    room.class_eval do
      include ChatParser
    end
  end
end
