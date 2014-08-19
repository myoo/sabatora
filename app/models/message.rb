class Message
  include Mongoid::Document

  field :room_id, type: Integer
  field :user_id, type: Integer
  field :user_name, type: String
  field :body, type: String
end
