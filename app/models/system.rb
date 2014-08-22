# -*- coding: utf-8 -*-
class System
  include ActiveModel::Model

  ############### 使用可能なTRPGシステム ###############

  TITLES = {
    :plane => 0,            # なし
    :cthulu => 1            # クトゥルフ神話TRPG
  }.freeze

  attr_reader :dice, :title, :about, :help

  def initialize(room, title = Titles[:plane])
    @dice = new_dice
    include_parser(room)

    @title = set_title
    @about = set_about
    @help = set_help
  end

end