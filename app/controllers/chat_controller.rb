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
    RobbyMessage.all.asc(:created_at).limit(500).each do |message|
      obj = { id: message.id, name: message.user_name, body: message.chat_message }
      broadcast_message :new_message, obj
    end

  end

  def new_message
    puts "called new_message: #{message}"
   RobbyMessage.create(
                       user_id: message[:id],
                        user_name: message[:name],
                        chat_message: message[:body]
                       )
    broadcast_message :new_message, message
    puts "broadchasted"
  end
end
