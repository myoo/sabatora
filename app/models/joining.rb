class Joining < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
  belongs_to :role

  validates :user, :community, :role, presence: true
  validates :user_id, uniqueness: {scope: :community}

end
