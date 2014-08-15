class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :joinings
  has_many :communities, through: :joinings
  has_many :players
  has_many :rooms, through: :players

  validates :name, :email, uniqueness: true

  before_create :generate_channel_key

  def joined?(community)
    Joining.where(user_id: self.id, community_id: community).count > 0
  end

  private
  def generate_channel_key
    begin
      key = SecureRandom.urlsafe_base64
    end while User.where(:channel_key => key).exists?
    self.channel_key = key
  end
end
