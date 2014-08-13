class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :joinings
  has_many :communities, through: :joinings
  has_many :players
  has_many :rooms, through: :players

  def joined?(community)
    Joining.where(user_id: self.id, community_id: community).count > 0
  end
end
