# -*- coding: utf-8 -*-
class System::CthuluSystem < System


  def new_character_params      # 後で別クラスに切り出し
    params = {
      STR: str, CON: con, SIZ: siz,
      DEX: dex, APP: app, SAN: san,
      INT: int, POW: pow, EDU: edu,
      IDEA: idea, LUCK: luck, KNOW: know,
      DB: db, MP: pow,                   # マジック・ポイントはPOWの初期値
      HP: hp
    }
  end

  private
    ###### TRPGタイトル #####
  def set_title
    "クトゥルフ神話TRPG"
  end

  ###### 説明 #####
  def set_about
    <<EOS

クトゥルフ神話TRPG
クトゥルフ神話TRPGのシステムで遊びます。
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

技能名: x  (xは自分の技能値)で技能判定ができます。
例）目星: 25

[name:x vs name:y] or [x vs y] で抵抗ロール判定ができます。
例）[STR:10 vs STR:12]

技能名:x and 技能名:y で組み合わせロールができます。
例）目星:25 and 図書館:50

EOS
  end

  def new_dice
    Dice::CthuluDice.new
  end

  def include_parser(room)
    room.class_eval do
      include CthuluParser
    end
  end


end
