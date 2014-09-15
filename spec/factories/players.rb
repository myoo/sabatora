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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    user nil
    room ""
    player_role nil
    character nil
  end
end
