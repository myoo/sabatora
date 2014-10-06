class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  field :room_id, type: Integer
  field :user_id, type: Integer
  field :user_name, type: String
  field :body, type: String

  scope :logs, ->(room_id, from, to) { where(:room_id => room_id, :created_at.gte => from, :created_at.lte => to) }
  scope :recent_logs, ->(room_id) { where(room_id: room_id).desc(:created_at).limit(500).asc(:created_at) }
end
