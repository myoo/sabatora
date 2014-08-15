# -*- coding: utf-8 -*-
class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    #controller_store[:message_count] = 0
    logger.debug "start chat session"
  end
  
  def client_connected
    logger.debug "user connected"
    #過去ログ表示
    # Message.all.asc(:created_at).limit(500).each do |message|
    #   obj = { room_id: message.room_id, user_id: message.user_id, name: message.user_name, body: message.body }
    #   WebsocketRails[message.room_id].trigger :new_message, obj
    # end
  end

  def enter_room
    puts "enter room: #{message}"
    # 過去ログ表示
    Message.where(room_id: message[:room_id]).limit(500).each do |log|
      send_message :new_message, log
    end
  end

  def new_message
    puts "called new_message: #{message}"
    # ログ記録
    Message.create message
  end
end
