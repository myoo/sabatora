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

class Map < ActiveRecord::Base
  include SessionComponents

  has_many :map_lists
  has_many :scenarios, through: :map_lists
  belongs_to :user
  belongs_to :community

  validates :title, :about, :image, :access, presence: true

  mount_uploader :image, MapUploader

end
