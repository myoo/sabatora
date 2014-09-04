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
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

class Character < ActiveRecord::Base
  belongs_to :user
  has_many :players

  attr_reader :system

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

  private

  def update_retry_number
    if self.retry_number.nil?
      self.retry_number = 0
    else
      self.retry_number += 1
    end
  end
end
