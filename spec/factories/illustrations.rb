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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :illustration do
    user nil
    access 1
    name "MyString"
    description "MyText"
    image "MyString"
  end
end
