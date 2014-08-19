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
    parse(message) unless message[:room_id] == '0'
    # ログ記録
    Message.create message
  end

  def room_message
    puts "called room_message"
    parse(message)
    WebsocketRails[message[:room_id]].trigger(:room_message, message)
  end

  def private_message
    at_user_name = message[:body].match(/\A@(.+)\s/)
    at_user = User.find_by!(name: at_user_name[1])
    WebsocketRails[at_user.channel_key].trigger :new_message, message
    parse message
    send_message :new_message, message
  rescue ActiveRecord::RecordNotFound => e
    send_message :new_message, {user_name: "system", body: "ユーザーが存在しません"}
  end

  private
  def room(room_id)
    unless message[:room_id] == '0'
      @room ||= Room.find(room_id)
      return @room
    else
      @room = nil
    end
  end

  def parse(message)
    unless message[:room_id] == '0'
      message[:body] = room(message[:room_id]).parse(message[:body], room(message[:room_id]).dice)
    else                        # ロビーはダイスなし
      message[:body] = Obscenity.sanitize(message[:body])
    end
    return message
  end
end
