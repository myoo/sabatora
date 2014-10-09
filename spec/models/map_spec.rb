# == Schema Information
#
# Table name: maps
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  about        :string(255)
#  description  :text
#  image        :string(255)      not null
#  access       :integer          not null
#  user_id      :integer          not null
#  community_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_maps_on_community_id  (community_id)
#  index_maps_on_user_id       (user_id)
#

require 'rails_helper'

RSpec.describe Map, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
