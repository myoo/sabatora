# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  channel_key            :string(255)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create(:user) }

  describe "#has_role?" do
    let(:room) { FactoryGirl.create(:room) }
    let(:role) { FactoryGirl.create(:player_role, name: "master" ) }

    before do
      Player.create(room: room, user: user, player_role: role)
    end

    subject{ user.has_room_role?(room, "master")}

    it{ should be_truthy  }

  end

  describe "is_owner?" do
    let(:room) { FactoryGirl.create(:room, owner: user) }

    subject { user.is_owner?(room) }

    it { should be_truthy }
  end
end
