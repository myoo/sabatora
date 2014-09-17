# == Schema Information
#
# Table name: character_statuses
#
#  id              :integer          not null, primary key
#  illustration_id :integer
#  character_id    :integer
#  room_id         :integer
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_character_statuses_on_character_id     (character_id)
#  index_character_statuses_on_illustration_id  (illustration_id)
#  index_character_statuses_on_room_id          (room_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character_status, :class => 'Character::Status' do
    illustration nil
    character nil
  end
end
