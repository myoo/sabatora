# -*- coding: utf-8 -*-
class Room < ActiveRecord::Base
  include Redis::Objects

  belongs_to :community
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :players
  has_many :users, through: :players
  has_many :backgrounds
  belongs_to :active_background, class_name: "Background", foreign_key: :active_background_id

  value :stored_dice

  validates :name, :about, :community, :owner, :system_id, presence: true

  attr_reader :dice, :system

  after_initialize :initialize_system
  after_create :initialize_dice
  after_update :change_system, if: Proc.new { |a| a.system_id_changed? }


  def initialize_system
    set_system
    initialize_dice unless self.id.nil?         # new直後は実行しない
  end

  def change_system
    set_system
    @dice = @system.dice
    store_dice
  end

  def initialize_dice
    if stored_dice.nil?
      @dice = @system.dice
      store_dice
    else
      @dice = Marshal.load(stored_dice)
    end
  end

  def store_dice
    stored_dice = Marshal.dump(@dice)
  end

  def owned?(user)
    self.user_id == user.id
  end

  def has_member?(user)
    self.players.where(user_id: user.id).length > 0
  end

  private
  def set_system
    @system_tytle = System::TITLES.key(system_id)
    klass = Module.const_get("System::#{@system_tytle.capitalize}System")
    @system = klass.new(self, system_id)
  end
end
