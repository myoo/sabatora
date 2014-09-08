class Community < ActiveRecord::Base
  has_many :joinings
  has_many :users, -> { order 'joinings.created_at DESC'}, through: :joinings
  has_many :rooms, -> { order(created_at: :desc) }
  has_many :backgrounds

  def has_member?(user)
    user.present? and self.joinings.where(user_id: user.id).length > 0
  end

  def is_owner?(user)
    joinings = self.joinings.where(user: user)
    joinings.length > 0 && joinings.joins(:role).where{role.name.eq "owner"}.length > 0
  end
end
