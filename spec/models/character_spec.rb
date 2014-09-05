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

require 'rails_helper'

RSpec.describe Character, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
