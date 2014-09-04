# -*- coding: utf-8 -*-
class CharacterCreator::Cthulu
  def initialize(dice)
    @dice = dice
  end

  def initialize_params
    str = @dice.roll(3, 6).first      # 3d6  rolebook p40
    con = @dice.roll(3, 6).first 
    pow = @dice.roll(3, 6).first
    dex = @dice.roll(3, 6).first
    app = @dice.roll(3, 6).first

    siz = @dice.roll(2, 6).first + 6  # 2d6+6 rolebook p40
    int = @dice.roll(2, 6).first + 6

    edu = @dice.roll(3, 6).first + 3  # 3d6+3 rolebook p40

    san = pow * 5               # 正気度
    idea = int * 5              # アイデア
    luck = pow * 5              # 幸運
    know = edu * 5              # 知識

    db = db_table(str, siz)

    max_san = 99               # rolebook p40

    hp = ((con + siz)/2).ceil   # rolebook p40
    mp = pow

    params = {
      STR: str, CON: con, SIZ: siz,
      DEX: dex, APP: app, SAN: san,
      INT: int, POW: pow, EDU: edu,
      IDEA: idea, LUCK: luck, KNOW: know,
      DB: db, MP: pow,                   # マジック・ポイントはPOWの初期値
      HP: hp, MAX_SAN: max_san
    }

  end

  def db_table(str, siz)
    # ダメージボーナス表 p40
    case
    when (str + siz) <= 12
      -1 * @dice.roll(1, 6)
    when (str + siz) <= 16
      -1 * @doce.roll(1, 4)
    when (str + siz) <= 24
      0
    when (str + siz) <= 32
      @dice.roll(1, 4)
    when (str + siz) <= 40
      @dice.roll(2, 6)
    when (str + siz) <= 56
      @dice.roll(3, 6)
    when (str + siz) <= 72
      @dice.roll(4, 6)
    when (str + siz) <= 88
      @dice.roll(5, 6)
    else
      number_of_dice = ((str + siz - 88).to_f/16).ceil + 5 # 『これ以上は＋16(およびその端数)ごとに1d6ずつ多くなる』
      @dice.roll(number_of_dice, 6)
    end
  end
end
