class Character < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_and_belongs_to_many :illustrations

  scope :owned, ->(user_id) { where(user_id: user_id) }
end
