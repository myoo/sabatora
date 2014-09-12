# -*- coding: utf-8 -*-
class RoomConfigController < WebsocketRails::BaseController
  before_action :set_room

  def background_changed
    puts "called background_changed"
    @room.active_background = Background.find(message[:background_id])
    if room.save
      message[:background_url] = room.active_background.image_url
      WebsocketRails["room_#{message[:room_id]}"].trigger(:background_changed, message)
      puts "changed"
    end
  end


  private
  def set_room
    @room =Room.find(message[:room_id])
  end
end
