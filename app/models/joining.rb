# == Schema Information
#
# Table name: joinings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  community_id :integer
#  role_id      :integer
#  comment      :text
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_joinings_on_community_id  (community_id)
#  index_joinings_on_role_id       (role_id)
#  index_joinings_on_user_id       (user_id)
#

class Joining < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
  belongs_to :role

  validates :user, :community, :role, presence: true
  validates :user_id, uniqueness: {scope: :community}

end
