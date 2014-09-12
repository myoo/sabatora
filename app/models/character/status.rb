class Character::Status < ActiveRecord::Base

  def self.table_name_prefix
    'character_'
  end

  belongs_to :character, dependent: :destroy
  belongs_to :room, dependent: :destroy
  belongs_to :illustration

  validates :character, :room, presence: true
end
