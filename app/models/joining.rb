# -*- coding: utf-8 -*-
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
  class InvalidOwnerError < StandardError; end

  belongs_to :user
  belongs_to :community
  belongs_to :role

  validates :user, :community, :role, presence: true
  validates :user_id, uniqueness: {scope: :community}

  before_save :confirm_owner
  before_destroy :transfer_owner

  private
  def confirm_owner
    if  owner_count > 0 && self.role.name == 'owner'
      raise InvalidOwnerError
    end
  end

  def transfer_owner
    if community.is_owner?(user)
      first_user = community.joinings.where.not(user_id: user.id).order(created_at: :asc).first
      return if first_user.nil?
      first_user.role = Role.find_by(name: "owner")
      Joining.skip_callback(:save, :before, :confirm_owner) # オーナーの確認をスキップ
      first_user.save
      Joining.set_callback(:save, :before, :confirm_owner) # オーナーの確認再設定
    end
  end

  def owner_count
    self.community.joinings.joins{:role}.where{roles.name.eq 'owner'}.count
  end
end
