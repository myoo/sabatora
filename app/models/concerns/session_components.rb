module SessionComponents
  extend ActiveSupport::Concern

  included do
    scope :public_access, -> { where(access: ACCESS_LEVEL[:PUBLIC]) }
    scope :community_access, -> (user_id){ where(access: ACCESS_LEVEL[:COMMUNITY_ONLY]).joins{user.joinings.community.joinings}.where{user.joinings.community.joinings.user_id.eq user_id} }
    scope :user_access, -> { where(access: ACCESS_LEVEL[:USER_ONLY]) }
  end

  module ClassMethods
    def available(user)
      where{
        (access.eq ACCESS_LEVEL[:USER_ONLY]) & (user_id.eq user.id) |
        (access.eq ACCESS_LEVEL[:COMMUNITY_ONLY]) & (community_id.in user.communities.pluck(:id)) |
        (access.eq ACCESS_LEVEL[:PUBLIC])
      }
    end
  end
end
