# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
#    can :read, :all

    # PlayRoom
    can :read, Room
    can :create, Room, community: { joinings: { user_id: user.id  } } # コミュニティメンバーのみ
    can :manage, Room, owner: { id: user.id }
    can :playspace, Room, players: { user_id: user.id }
  end
end
