# == Schema Information
#
# Table name: player_roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PlayerRole < ActiveRecord::Base
  has_many :players
end
