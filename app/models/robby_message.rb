class RobbyMessage
  include Mongoid::Document

  field :user_id, type: Integer
  field :user_name, type: String
  field :chat_message, type: String
end
