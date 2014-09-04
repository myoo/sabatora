# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  about      :string(255)
#  system_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

class Character < ActiveRecord::Base
  belongs_to :user
  has_many :players

  scope :owned, ->(user_id) { where(user_id: user_id) }
end
