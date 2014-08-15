class Room < ActiveRecord::Base
  belongs_to :community
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :players
  has_many :users, through: :players

  validates :name, :about, :community, :owner, presence: true
end
