class Room < ActiveRecord::Base
  include Redis::Objects
  include ChatParser

  belongs_to :community
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :players
  has_many :users, through: :players

  value :stored_dice

  validates :name, :about, :community, :owner, presence: true

  attr_reader :dice

  after_initialize :initialize_dice


  def initialize_dice
    if stored_dice.nil?
      @dice = Dice.new
    else
      @dice = Marcial.load(stored_dice)
    end
  end

  def store_dice
    stored_dice = Marcial.dump(@dice)
  end
end
