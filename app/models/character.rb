class Character < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_and_belongs_to_many :illustrations
  has_many :statuses, class_name: "Character::Status"

  scope :owned, ->(user_id) { where(user_id: user_id) }

  def current_status(room_id)
    unless status = self.statuses.find_by(room_id: room_id)
      status = Character::Status.create(
                             room_id: room_id,
                             character_id: self.id
                               )
    end
    status
  end
end
