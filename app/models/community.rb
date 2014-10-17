# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: communities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  about       :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  header      :string(255)
#  icon        :string(255)
#

class Community < ActiveRecord::Base
  has_many :joinings, dependent: :delete_all # transfer_ownerを呼び出さないように
  has_many :users, -> { order 'joinings.created_at DESC'}, through: :joinings
  has_many :rooms, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :backgrounds, dependent: :destroy

  mount_uploader :header, HeaderUploader
  mount_uploader :icon, IconUploader

  validates :header, file_size: { maximum: 5.megabytes.to_i }
  validates :icon, file_size: { maximum: 0.5.megabytes.to_i }

  def has_member?(user)
    user.present? and self.joinings.where(user_id: user.id).length > 0
  end

  def is_admin?(user)
    return false unless has_member?(user)
     self.joinings.where(user: user).joins(:role).where{role.name.in %w(owner administrator)}.length > 0
  end

  def is_owner?(user)
    joinings = self.joinings.where(user: user)
    joinings.length > 0 && joinings.joins(:role).where{role.name.eq "owner"}.length > 0
  end

  scope :user_joins, -> (user_id){ joins(:joinings).where{joinings.user_id.eq user_id} }

end
