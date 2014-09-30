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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'testfiles','flower.jpg')) }
    introduction "MyText"
    sex 1
    birth "2014-09-25"
    user
  end
end
