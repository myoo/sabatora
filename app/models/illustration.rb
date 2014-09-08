class Illustration < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :characters

  validates :name, :image, :access, presence: true

  mount_uploader :image, IllustrationImageUploader

  ACCESS_LEVEL = {
    PUBLIC: 0,
    COMMUNITY_ONLY: 1,
    USER_ONLY: 2
  }

  def self.usables(user)
    tmp = public_access + community_access(user.id) + user_access
  end

  scope :public_access, -> { where(access: ACCESS_LEVEL[:PUBLIC]) }
  scope :community_access, -> (user_id){ where(access: ACCESS_LEVEL[:COMMUNITY_ONLY]).joins{user.joinings.community.joinings}.where{user.joinings.community.joinings.user_id.eq user_id} }
  scope :user_access, -> { where(access: ACCESS_LEVEL[:USER_ONLY]) }

end
