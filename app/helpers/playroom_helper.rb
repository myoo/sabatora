# -*- coding: utf-8 -*-
module PlayroomHelper
  def play_name(user)
    role = @room.play_role(user)
    case role.name
    when 'master'
      return 'master'
    when 'player'
      if character = @room.character(user)
        character.name
      else
        '未定'
      end
    else
      'ROM'
    end
  end
end
