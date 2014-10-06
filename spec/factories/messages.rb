# -*- coding: utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    room_id 1
    user_id 1
    user_name "testname"
    sequence(:body, 1) { |n| "#{n}番目のメッセージです" }
  end
end
