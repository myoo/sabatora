# == Schema Information
#
# Table name: backgrounds
#
#  id           :integer          not null, primary key
#  room_id      :integer
#  image        :string(255)
#  name         :string(255)
#  about        :text
#  user_id      :integer
#  access       :integer
#  community_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_backgrounds_on_community_id  (community_id)
#  index_backgrounds_on_room_id       (room_id)
#  index_backgrounds_on_user_id       (user_id)
#

class Background < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :community

  validates :name, :image, presence: true

  mount_uploader :image, BackgroundUploader

  ACCESS_LEVEL = {
    PUBLIC: 0,
    COMMUNITY_ONLY: 1,
    USER_ONLY: 2
  }

  after_create do
    if room.present? && room.active_background.nil?
      room.active_background = self
      room.save
    end
  end
end
