class Player < ActiveRecord::Base
  belongs_to :user, inverse_of: :players
  belongs_to :player_role
  belongs_to :character
  belongs_to :room, inverse_of: :players

  validates :user, :room, :player_role, presence: true
end
