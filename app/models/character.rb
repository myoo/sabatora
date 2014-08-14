class Character < ActiveRecord::Base
  belongs_to :user
  has_many :players

  scope :owned, ->(user_id) { where(user_id: user_id) }
end
