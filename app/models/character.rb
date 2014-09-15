# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: characters
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(255)
#  about        :string(255)
#  system_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#  paramaters   :text
#  retry_number :integer
#  profile      :text
#  memo         :text
#  status       :text
#  image        :string(255)
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

class Character < ActiveRecord::Base
  belongs_to :user
  has_many :players
  has_and_belongs_to_many :illustrations
  has_many :statuses, class_name: "Character::Status"

  attr_reader :system

  mount_uploader :image, CharacterUploader

  validates :user_id, :name, :system_id, presence: true

  after_initialize :set_system
  before_create :initialize_params


  def set_system
    return if self.system_id.nil?
    @system_tytle = System::TITLES.key(system_id)
    klass = Module.const_get("System::#{@system_tytle.capitalize}System")
    @system = klass.new(self, system_id)
  end

  def initialize_params
    self.paramaters = @system.new_character_params.to_s # 後でもう少しくらいきれいに出力する
    update_retry_number
  end

  scope :owned, ->(user_id) { where(user_id: user_id) }

  def current_status(room_id)
    unless status = self.statuses.find_by(room_id: room_id)
      status = Character::Status.create(
                             room_id: room_id,
                             character_id: self.id
                               )
    end
    status
  end

  private

  def update_retry_number
    if self.retry_number.nil?
      self.retry_number = 0
    else
      self.retry_number += 1
    end
  end
end
