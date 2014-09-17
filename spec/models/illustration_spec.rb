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

require 'rails_helper'

RSpec.describe Illustration, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
