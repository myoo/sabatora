class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    #controller_store[:message_count] = 0
    logger.debug "start chat session"
  end

  def new_message
    puts "called new_message: #{message}"
    broadcast_message :new_message, message
    puts "broadchasted"
  end
end
