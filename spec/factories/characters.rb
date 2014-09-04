# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  about      :string(255)
#  system_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_characters_on_user_id  (user_id)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character do
    user nil
    name "MyString"
    about "MyString"
    system_id 1
  end
end
