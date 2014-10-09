# == Schema Information
#
# Table name: illustrations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  access      :integer          default(2)
#  name        :string(255)      not null
#  description :text
#  image       :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_illustrations_on_user_id  (user_id)
#

class Illustration < ActiveRecord::Base
  include SessionComponents

  belongs_to :user
  has_and_belongs_to_many :characters
  has_many :statuses, class_name: "Character::Status"

  validates :name, :image, :access, presence: true

  mount_uploader :image, IllustrationImageUploader


  scope :public_access, -> { where(access: ACCESS_LEVEL[:PUBLIC]) }
  scope :community_access, -> (user_id){ where(access: ACCESS_LEVEL[:COMMUNITY_ONLY]).joins{user.joinings.community.joinings}.where{user.joinings.community.joinings.user_id.eq user_id} }
  scope :user_access, -> { where(access: ACCESS_LEVEL[:USER_ONLY]) }

end
