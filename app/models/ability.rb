# -*- coding: utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
#    can :read, :all

    # Community
    can :read, Community
    can :manage, Community.all do |community|
      community.is_owner?(user)
    end
    can :create, Community      # あとで制限追加

    # Room
    can :read, Room
    can :character_status, Room
    can :join, Room, community: { joinings: { user_id: user.id  } } # コミュニティメンバーのみ
    can :create, Room, community: { joinings: { user_id: user.id  } } # コミュニティメンバーのみ
    can :manage, Room, owner: { id: user.id  }

    # Player
    can :read, Player
    can :create, Player do |player|
      player.room.community.has_member? user
    end
    can :update, Player, user_id: user.id
    can :destroy, Player, user_id: user.id
    can :destroy, Player, room: { owner_id: user.id }

    # Playspace
    can :playspace, Room do |room|
      room.has_member?(user)
    end
  end
end
