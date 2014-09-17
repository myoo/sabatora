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

class Character::Status < ActiveRecord::Base

  def self.table_name_prefix
    'character_'
  end

  belongs_to :character, dependent: :destroy
  belongs_to :room, dependent: :destroy
  belongs_to :illustration

  validates :character, :room, presence: true
end
