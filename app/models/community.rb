class Community < ActiveRecord::Base
  has_many :joinings
  has_many :users, -> { order 'joinings.created_at DESC'}, through: :joinings
  has_many :rooms, -> { order(created_at: :desc) }

  def has_member?(user)
    self.joinings.where(user_id: user.id).length > 0
  end
end
