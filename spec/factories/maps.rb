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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :map do
    title "MyString"
    about "MyString"
    description "MyText"
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'testfiles', 'map.jpg')) }
    access 1
    user
    community
  end

  trait :public do
    access ACCESS_LEVEL[:PUBLIC]
  end
end
