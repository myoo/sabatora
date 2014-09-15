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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :joining do
    user nil
    communitiy nil
    role nil
    comment "MyText"
  end
end
