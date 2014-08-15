class Community < ActiveRecord::Base
  has_many :joinings
  has_many :users, through: :joinings
  has_many :rooms
end
