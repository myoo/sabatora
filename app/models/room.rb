# -*- coding: utf-8 -*-
class Room < ActiveRecord::Base
  include Redis::Objects

  belongs_to :community
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :players
  has_many :users, through: :players

  value :stored_dice

  validates :name, :about, :community, :owner, :system_id, presence: true

  attr_reader :dice

  after_initialize :initialize_system
  after_create :initialize_dice


  def initialize_system
    @system_tytle = System::TITLES.key(system_id)
    klass = Module.const_get("#{@system_tytle.capitalize}System")
    @system = klass.new(self, system_id)

    initialize_dice unless self.id.nil?         # new直後は実行しない
  end

  def initialize_dice
    if stored_dice.nil?
      @dice = @system.dice
    else
      @dice = Marcial.load(stored_dice)
    end
  end

  def store_dice
    stored_dice = Marcial.dump(@dice)
  end
end
