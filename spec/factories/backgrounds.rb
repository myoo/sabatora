# == Schema Information
#
# Table name: backgrounds
#
#  id           :integer          not null, primary key
#  room_id      :integer
#  image        :string(255)
#  name         :string(255)
#  about        :text
#  user_id      :integer
#  access       :integer
#  community_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_backgrounds_on_community_id  (community_id)
#  index_backgrounds_on_room_id       (room_id)
#  index_backgrounds_on_user_id       (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :background do
    room nil
    image "MyString"
    name "MyString"
    about "MyText"
    user nil
    access 1
    community nil
  end
end
