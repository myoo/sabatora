class Background < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :community

  validates :name, :image, presence: true

  mount_uploader :image, BackgroundUploader

  ACCESS_LEVEL = {
    PUBLIC: 0,
    COMMUNITY_ONLY: 1
    USER_ONLY: 2
  }

  after_create do
    if room.active_background.nil?
      room.active_background = self
      room.save
    end
  end
end
