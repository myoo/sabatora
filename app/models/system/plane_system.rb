# -*- coding: utf-8 -*-
class System::PlaneSystem < System

  private

  ###### TRPGタイトル #####
  def set_title
    "基本システム"
  end

  ###### 説明 #####
  def set_about
    <<EOS

基本のシステム。大小の判定のみ

ToDo:説明をかく
EOS
  end

  ###### ダイスヘルプ #####
  def set_help
    <<EOS
とりあえず nDmでダイス振れる
nDm+nDm+.......で合計値
nDm>10 とかで成功・失敗判定

ToDo:説明かく
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
