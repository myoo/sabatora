class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :player_role
  belongs_to :character
  belongs_to :room

  validates :user, :player_role, presence: true
end
