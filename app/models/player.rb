# == Schema Information
#
# Table name: players
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  room_id        :integer
#  player_role_id :integer
#  character_id   :integer
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_players_on_character_id    (character_id)
#  index_players_on_player_role_id  (player_role_id)
#  index_players_on_user_id         (user_id)
#

class Player < ActiveRecord::Base
  belongs_to :user, inverse_of: :players
  belongs_to :player_role
  belongs_to :character
  belongs_to :room, inverse_of: :players

  validates :user, :room, :player_role, presence: true
end
