# == Schema Information
#
# Table name: communities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  about       :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  header      :string(255)
#  icon        :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :community do
    name "MyString"
    about "MyText"
    description "MyText"
  end
end
