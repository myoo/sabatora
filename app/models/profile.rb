# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  avatar       :string(255)
#  introduction :text
#  sex          :integer
#  birth        :date             not null
#  user_id      :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ActiveRecord::Base
  belongs_to :user

  validates :birth, :user, presence: true
  validates :introduction, length: { maximum: 600 }

  mount_uploader :avatar, AvatarUploader

  SEX_TYPE = {
    male: 0,
    female: 1,
    other: 9
  }

end
