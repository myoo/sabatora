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

require 'rails_helper'

RSpec.describe Profile, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
